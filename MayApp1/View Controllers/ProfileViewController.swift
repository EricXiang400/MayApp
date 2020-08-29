//
//  ProfileViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/24/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//
import Foundation
import UIKit
import Firebase
import Photos
import FirebaseStorage
import FirebaseDatabase

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var ref = Database.database().reference()
    @IBOutlet weak var locationTextField: UITextView!
    @IBOutlet weak var nameTextField: UITextView!
    @IBOutlet weak var roleTextField: UITextView!
    
    private let storage = Storage.storage().reference(forURL: "gs://may-app-c3e93.appspot.com")
    
    @IBAction func logOutButton(_ sender: Any) {
        AppManager.shared.logout(elf: self)
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
//        let userID = Auth.auth().currentUser?.uid
        ref.child("\(Replacement.emailReplacement)").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let firstName = value?["first_name"] as? String
            let lastName = value?["last_name"] as? String
            let role = value?["role"] as? String
            let location = value?["location"] as? String
            self.nameTextField.text = firstName! + lastName!
            self.roleTextField.text = role
            self.locationTextField.text = location

            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
            let url = URL(string: urlString) else {
                return
        }
        
        let task =  URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                let pickedImage = UIImage(data: data)
                self.profileImageView.image = pickedImage
            }
        })
        task.resume()
    }
    
    @IBAction func didTapAddPhotoButton(_ sender: Any) {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (button) in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (button) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        profileImageView.image = pickedImage
        
        dismiss(animated: true, completion: nil)
        guard let imageData = pickedImage.pngData() else {
            return
        }
        
        storage.child("profileImage/file.png").putData(imageData, metadata: nil, completion: { _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            self.storage.child("profileImage/file.png").downloadURL(completion: {url, error in
                guard let url = url, error == nil else {
                    return
                }
                
                let urlString = url.absoluteString
                print("Download URL:\(urlString)")
                UserDefaults.standard.set(urlString, forKey: "url")
            })
            
        })
    }
    
    
}



