//
//  BuyViewController.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class BuyVC: UIViewController {
    
    weak var coordinator: BuyCoordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
    }
    
    
    private func configureVC() {
        view.backgroundColor    = .systemBackground
        title                   = "tralala"
        navigationController?.navigationBar.prefersLargeTitles          = true
    }
}

