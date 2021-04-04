//
//  BuyViewController.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class BuyVC: UIViewController {
    
    var goNextButton           = UIButton()
    weak var coordinator: BuyCoordinator?
    var selectedProduct = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layoutUI()
        configureButton()
    }
    
    
    @objc private func goNextButtonTapped() {
        coordinator?.goNextFlow(with: selectedProduct)
    }
    
    
    private func configureButton() {
        goNextButton.addTarget(self, action: #selector(goNextButtonTapped), for: .touchUpInside)
        goNextButton.setTitle("GoNextVC", for: .normal)
        goNextButton.setTitleColor(.red, for: .normal)
    }
    
    
    private func configureVC() {
        view.backgroundColor    = .systemBackground
        title                   = "BuyVC"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func layoutUI() {
        goNextButton.translatesAutoresizingMaskIntoConstraints             = false
        view.addSubview(goNextButton)
      
        
        NSLayoutConstraint.activate([
            goNextButton.centerXAnchor.constraint              (equalTo: view.centerXAnchor),
            goNextButton.centerYAnchor.constraint              (equalTo: view.centerYAnchor),
            goNextButton.heightAnchor.constraint               (equalToConstant: 50),
            goNextButton.widthAnchor.constraint                (equalToConstant: 150),
        ])
    }

}

