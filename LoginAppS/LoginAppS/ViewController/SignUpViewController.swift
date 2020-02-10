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
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        
        let error = validateFields()
        
                if error != nil {
                    showError(error!)
                }
                else{
        
                    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let apellido = apellidoTextField.text
                    let nombre = nombreTextField.text
        
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
        
                        if error != nil{
                            //Error al crear usuario
                            self.showError("Error al crear usuario")
                        }
                        else
                        {
                            //En el result viene el uid del usuario recien creado
                            let db = Firestore.firestore()
        
                            db.collection("users").addDocument(data: ["apellido":apellido, "nombre":nombre, "uid":result!.user.uid ]) { (error) in
        
                                if error != nil{
                                    self.showError("Error al guardar datos de usuario") //no se pudo guardar el nombre y apellido de usuario, VER
                                }
        
                            }
        
                            self.irAHome()
                        }
                    }
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
}
