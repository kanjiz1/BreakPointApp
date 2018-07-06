//
//  AuthVC.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/6/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInByEmailButtonWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: LOGIN_VC)
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func signInByGoogleButtonWasPressed(_ sender: Any) {
    }
    @IBAction func signInByFacebookButtonWasPressed(_ sender: Any) {
    }
}
