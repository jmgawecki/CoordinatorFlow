//
//  CreateAccountCoordinator.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class CreateAccountCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    weak var goNextCoordinator: GoNextCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateAccountVC()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
}
