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
    
    var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureButton()
        // Do any additional setup after loading the view.
    }
    
    
    init(parameter: Int) {
        super.init(nibName: nil, bundle: nil)
        self.parameter = parameter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc private func buttonTapped() {
        coordinator?.createAccount()
    }
    
    
    private func configureVC() {
        view.backgroundColor    = .systemBackground
        title                   = "GoNextVC"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    private func configureButton() {
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.red, for: .normal)
        
        button.addTarget(self, action: #selector(buttonTapped
            ), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 150),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
