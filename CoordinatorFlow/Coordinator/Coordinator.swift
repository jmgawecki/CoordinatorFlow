//
//  Coordinator.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators:      [Coordinator] { get set }
    var navigationController:   UINavigationController { get set }
    
    func start() 
}
