//
//  LoginVC.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/6/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailField: InSetTextField!
    @IBOutlet weak var passwordField: InSetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self
    }
    
    @IBAction func signInButtonWasPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!) { (success, error) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: error?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, error) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginCreationComplete: { (success, error) in
                            print("Successfully Registered User")
                            self.dismiss(animated: true, completion: nil)
                        })
                    } else{
                        print(String(describing: error?.localizedDescription))
                    }
                })
            }
        }
    }
    
    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
}

