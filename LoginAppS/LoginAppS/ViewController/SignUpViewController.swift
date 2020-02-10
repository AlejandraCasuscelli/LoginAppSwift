//
//  SignUpViewController.swift
//  LoginAppS
//
//  Created by Alejandra Casuscelli on 10/02/2020.
//  Copyright © 2020 Alejandra Casuscelli. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

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
        
        if nombreTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            apellidoTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Por favor rellene todos los campos"
        }
        
        //Agregar otras validaciones luego
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else{
            Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>) { (result, error) in
                <#code#>
                if error != nil{
                    //Error al crear usuario
                    self.showError("Error al crear usuario")
                }
                else
                {
                    
                }
            }
        }
    }
    
    func showError (_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
