//
//  MeVC.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/6/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLabel.text = Auth.auth().currentUser?.email
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
        profileImage.layer.cornerRadius = 30
        profileImage.layer.masksToBounds = true
    }

    @IBAction func signOutButtonWasPressed(_ sender: Any) {
        let logoutPopUp = UIAlertController(title: "Logout?", message: "Are you sure you want to Logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
        do {
            try Auth.auth().signOut()
            let authVC = self.storyboard?.instantiateViewController(withIdentifier: AUTH_VC) as? AuthVC
            self.present(authVC!, animated: true, completion: nil)
        } catch {
            print(error.localizedDescription)
            }
        }
        logoutPopUp.addAction(logoutAction)
        presentDetail(logoutPopUp)
    }
}

extension MeVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        print("Profile image tapped")
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        presentDetail(picker)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            selectedImageFromPicker = editedImage
            profileImage.image = selectedImageFromPicker
        } else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            selectedImageFromPicker = originalImage
            profileImage.image = selectedImageFromPicker
        }
        
        if profileImage.image == selectedImageFromPicker{
            profileImage.image = selectedImageFromPicker
        }
        
        DataService.instance.uploadImages(profileImage: selectedImageFromPicker!) { (complete) in
            if complete {
                self.dismissDetail()
            }
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissDetail()
    }
}










