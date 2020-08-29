//
//  File.swift
//  MayApp1
//
//  Created by Calvin Du on 6/21/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController:UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        // Hide the error label
        errorLabel.alpha = 0

        //style the elements
        Utilities.styleTextField(usernameField)
        Utilities.styleTextField(emailField)
        Utilities.styleTextField(passwordField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    func validateFields() -> String? {
           
           // Check that all fields are filled in
           if usernameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
               passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
               
               return "Please fill in all fields."
           }
           
           // Check if the password is secure
           let cleanedPassword = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
           
           if Utilities.isPasswordValid(cleanedPassword) == false {
               // Password isn't secure enough
               return "Please make sure your password is at least 6 characters"
           }
           
           return nil
       }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
          // Validate the fields
                let error = validateFields()
                
                if error != nil {
                    
                    // There's something wrong with the fields, show error message
                    showError(error!)
                }
                else {
                    
                    // Create cleaned versions of the data
                    let userName = usernameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    // Create the user
                    Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { (result, err) in
                        
                        // Check for errors
                        if err != nil {
                            
                            // There was an error creating the user
                            self.showError("Error creating user")
                        }
                        else {
                            
                            // User was created successfully, now store the first name and last name
                            let db = Firestore.firestore()
                        
                            db.collection("users").addDocument(data: ["username":userName,"email":email, "password":password, "uid": result!.user.uid ]) { (error) in
                                
                                if error != nil {
                                    // Show error message
                                    self.showError("Error saving user data")
                                }
                            }
                            
                            // Transition to the home screen
                            self.transitionToHome()
                        }
                        
                    }
        
                }
            }
            
            func showError(_ message:String) {
                
                errorLabel.text = message
                errorLabel.alpha = 1
            }
            
            func transitionToHome() {
                
                let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UITabBarController
                
                view.window?.rootViewController = homeViewController
                view.window?.makeKeyAndVisible()
                
            }
            
        }
