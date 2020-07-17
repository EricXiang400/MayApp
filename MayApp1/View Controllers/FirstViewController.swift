//
//  firstviewcontroller.swift
//  MayApp1
//
//  Created by Calvin Du on 6/21/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit

class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
    }
    func setUpElements() {
        Utilities.styleFilledButton(logInButton)
        Utilities.styleFilledButton(signUpButton)
        
        
    }
}
