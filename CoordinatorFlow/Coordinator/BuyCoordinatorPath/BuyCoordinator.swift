//
//  BuyCoordinator.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class BuyCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        navigationController.delegate = self
        let vc = BuyVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func goNextFlow(with parameter: Int) {
        let child = GoNextCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.pushVC(with: parameter)
    }
    
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                print(childCoordinators)
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // we need to check wether our array already contains this view controller
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        if let goNextVC = fromViewController as? GoNextVC {
            childDidFinish(goNextVC.coordinator
            )
        }
    }

}
