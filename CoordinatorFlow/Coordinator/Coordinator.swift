//
//  Coordinator.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

// when conforming to AnyObject (class perhaps?) we can then compare array of childCoordinators with the child that we want to remove from our array.
protocol Coordinator: AnyObject {
    var childCoordinators:      [Coordinator] { get set }
    var navigationController:   UINavigationController { get set }
    
    func start()
}
