//
//  ViewController.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    var buyButton           = UIButton()
    var createAccountButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureUIElements()
        layoutUI()
        configureButtons()
    }

    
    private func configureVC() {
        view.backgroundColor    = .systemBackground
        title                   = "tralala"
        navigationController?.navigationBar.prefersLargeTitles          = true
    }
    
    
    // MARK: - @Objective
    
    
    @objc private func buyButtonTapped() {
        coordinator?.buySubscription()
    }
    
    
    @objc private func createAccountButtonTapped() {
        coordinator?.createAccount()
    }
    
    
    // MARK: - Private function
    
    private func configureButtons() {
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - VC Configuration
    
    
    private func configureUIElements() {
        buyButton.setTitle("Buy", for: .normal)
        createAccountButton.setTitle("Create", for: .normal)
        
        buyButton.setTitleColor(.red, for: .normal)
        createAccountButton.setTitleColor(.red, for: .normal)
    }
    
    
    private func layoutUI() {
        buyButton.translatesAutoresizingMaskIntoConstraints             = false
        createAccountButton.translatesAutoresizingMaskIntoConstraints   = false
        view.addSubview(buyButton)
        view.addSubview(createAccountButton)
        
        NSLayoutConstraint.activate([
            buyButton.centerXAnchor.constraint              (equalTo: view.centerXAnchor),
            buyButton.centerYAnchor.constraint              (equalTo: view.centerYAnchor),
            buyButton.heightAnchor.constraint               (equalToConstant: 50),
            buyButton.widthAnchor.constraint                (equalToConstant: 150),
            
            createAccountButton.topAnchor.constraint        (equalTo: buyButton.bottomAnchor, constant: 20),
            createAccountButton.centerXAnchor.constraint    (equalTo: view.centerXAnchor),
            createAccountButton.heightAnchor.constraint     (equalToConstant: 50),
            createAccountButton.widthAnchor.constraint      (equalToConstant: 150),
        ])
    }

}

