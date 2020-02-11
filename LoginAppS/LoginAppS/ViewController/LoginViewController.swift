//
//  LoginViewController.swift
//  LoginAppS
//
//  Created by Alejandra Casuscelli on 10/02/2020.
//  Copyright © 2020 Alejandra Casuscelli. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    enum loginError:Error {
        case formularioIncompleto
        case usuarioInvalido
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }

    func validateFields() throws {
        
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            throw loginError.formularioIncompleto
        }
    }
    
    func showError (_ message:String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func irAHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    func login(){
        do {
            try validateFields()
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil{
                    self.showError("Usuario invalido")
                }
                else{
                    self.irAHome()
                }
            }
            
        } catch loginError.formularioIncompleto {
            showError("Por favor complete todos los campos")
        } catch {
            showError("Ha ocurrido un error interno")
        }
    }

    @IBAction func loginTapped(_ sender: Any) {
        login()
    }
    
}
