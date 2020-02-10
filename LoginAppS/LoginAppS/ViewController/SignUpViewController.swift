//
//  SignUpViewController.swift
//  LoginAppS
//
//  Created by Alejandra Casuscelli on 10/02/2020.
//  Copyright © 2020 Alejandra Casuscelli. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nombreTextField: UITextField!
    
    @IBOutlet weak var apellidoTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(nombreTextField)
        Utilities.styleTextField(apellidoTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }

    func validateFields() -> String? {
        
        
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
    }
}
