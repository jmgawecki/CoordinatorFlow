//
//  GoNextVC.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class GoNextVC: UIViewController {
    
    weak var coordinator: GoNextCoordinator?
    var parameter: Int!
    
    var goToCreateButton:   UIButton!
    var goBackToHomeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureButtons()
        layoutUI()
        // Do any additional setup after loading the view.
    }
    
    
    init(parameter: Int) {
        super.init(nibName: nil, bundle: nil)
        self.parameter = parameter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func goToCreateButtonTapped() {
        coordinator?.createAccount()
    }
    
    
    @objc private func goBackToHomeButtonTapped() {
        coordinator?.goBackToHome()
    }
    
    
    private func configureVC() {
        self.configureVC(title: "GoNextVC", backgroundColor: .systemBackground, isTitleLarge: true)
    }
    
    
    private func configureButtons() {
        goToCreateButton = UIButton()
        goToCreateButton.setTitle("Create Account", for: .normal)
        goToCreateButton.setTitleColor(.red, for: .normal)
        goToCreateButton.layer.borderWidth = 1
        
        goToCreateButton.addTarget(self, action: #selector(goToCreateButtonTapped), for: .touchUpInside)
        
        goBackToHomeButton = UIButton()
        goBackToHomeButton.setTitle("Go back to Home", for: .normal)
        goBackToHomeButton.setTitleColor(.red, for: .normal)
        goBackToHomeButton.layer.borderWidth = 1
        
        goBackToHomeButton.addTarget(self, action: #selector(goBackToHomeButtonTapped), for: .touchUpInside)
    }

    
    private func layoutUI() {
        goToCreateButton.translatesAutoresizingMaskIntoConstraints      = false
        goBackToHomeButton.translatesAutoresizingMaskIntoConstraints    = false
        view.addSubview(goToCreateButton)
        view.addSubview(goBackToHomeButton)
        
        
        NSLayoutConstraint.activate([
            goToCreateButton.centerXAnchor.constraint   (equalTo: view.centerXAnchor),
            goToCreateButton.centerYAnchor.constraint   (equalTo: view.centerYAnchor),
            goToCreateButton.widthAnchor.constraint     (equalToConstant: 150),
            goToCreateButton.heightAnchor.constraint    (equalToConstant: 50),
            
            goBackToHomeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            goBackToHomeButton.topAnchor.constraint(equalTo: goToCreateButton.bottomAnchor, constant: 40),
            goBackToHomeButton.widthAnchor.constraint(equalToConstant: 150),
            goBackToHomeButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
