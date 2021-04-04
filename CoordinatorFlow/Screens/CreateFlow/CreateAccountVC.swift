//
//  CreateAccountVC.swift
//  CoordinatorFlow
//
//  Created by Jakub Gawecki on 03/04/2021.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    weak var coordinator: CreateAccountCoordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    
    private func configureVC() {
        self.configureVC(title: "Create an Account", backgroundColor: .systemBackground, isTitleLarge: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
