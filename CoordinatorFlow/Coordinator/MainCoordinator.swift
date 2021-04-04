//
//  MainCoordinator.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit



// We conform to NSObject so we can Conform to UINavCDelegate so our MainCoordinator can detect interaction with the NavC directly
class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    // Child coordinators. When requested pushing, child coordinator is being added to childCoordinators.
    // It seems like when you create more than one subCoordinator, when childCoordinators do not exists, pushingVC is faulty
    var childCoordinators           = [Coordinator]()
    var navigationController:       UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }


    // Function for initial start, run in SceneDelegate
    func start() {
        navigationController.delegate = self // we need to ask our navC whenever a VC is shown and that is why add it
        let vc                  = ViewController()
        vc.coordinator          = self
        navigationController.pushViewController(vc, animated: false)
    }


    // buySubscription run from ViewController() when button is tapped
    func buySubscription() {
        let child               = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }


    // createAccount run frm ViewController() when button is tapped
    func createAccount() {
        let child               = CreateAccountCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }


//     childDidFinish run from ChildCoordinator classes. Assigned to delegate
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                print(childCoordinators)
                childCoordinators.remove(at: index)
                break
            }
        }
    }


//     this is the method that we call by delegate when a view controller has been shown
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // we need to check wether our array already contains this view controller
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let buyViewController = fromViewController as? BuyVC {
            childDidFinish(buyViewController.coordinator)
        }

        if let createAccountVC = fromViewController as? CreateAccountVC {
            childDidFinish(createAccountVC.coordinator)
        }
    }


}
