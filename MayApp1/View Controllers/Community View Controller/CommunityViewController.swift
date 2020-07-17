//
//  CommunityViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/2/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit



class CommunityViewController: UIViewController{
    
    @IBOutlet weak var tutorRoundButton: UIButton!
    @IBOutlet weak var personalRoundButton: UIButton!
    @IBOutlet weak var professionalRoundButton: UIButton!
    @IBOutlet weak var houseRoundButton: UIButton!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tutorRoundButton.layer.cornerRadius = 20.0
        tutorRoundButton.layer.masksToBounds = true
        personalRoundButton.layer.cornerRadius = 20.0
        personalRoundButton.layer.masksToBounds = true
        professionalRoundButton.layer.cornerRadius = 20.0
        professionalRoundButton.layer.masksToBounds = true
        houseRoundButton.layer.cornerRadius = 20.0
        houseRoundButton.layer.masksToBounds = true
        
        
    }
    

}
