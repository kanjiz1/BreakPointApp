//
//  CreatePostVC.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/6/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendButton.bindToKeyboard()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
    }

    @IBAction func closeButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func sendButtonWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say Something Here..."{
            sendButton.isEnabled = false
            DataService.instance.uploadPosts(uploadPostWithMessage: textView.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroup: nil) { (isComplete) in
                if isComplete {
                    self.sendButton.isEnabled = true
                    self.dismissDetail()
                } else{
                    self.sendButton.isEnabled = true
                    print("There's an error")
                }
            }
        }
    }
}

extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
