//
//  GoNextCoordinator.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class GoNextCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    weak var parentCoordinator: BuyCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {}
    
    
    func pushVC(with parameter: Int) {
        let vc = GoNextVC(parameter: parameter)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    func createAccount() {
        let child = CreateAccountCoordinator(navigationController: navigationController)
        child.goNextCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) { return }
        
        if let goCreateVC = fromViewController as? CreateAccountVC {
            childDidFinish(goCreateVC.coordinator)
        }
    }
    
    
}
