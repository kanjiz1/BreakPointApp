//
//  AuthService.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/6/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) ->()){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            guard let user = user else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": user.user.providerID, "email": user.user.email]
            
            DataService.instance.createDBUSer(uid: user.user.uid, userData: userData)
            
            userCreationComplete(true, nil)
        }
    }
    
    func loginUser(withEmail email: String, andPassword password: String, loginCreationComplete: @escaping (_ status: Bool, _ error: Error?) ->()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if error != nil{
                loginCreationComplete(false, nil)
                return
            }
            loginCreationComplete(true, nil)
        }
    }
}
