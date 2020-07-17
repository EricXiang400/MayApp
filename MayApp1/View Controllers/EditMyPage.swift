//
//  EditMyPage.swift
//  MayApp1
//
//  Created by Calvin Du on 7/5/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage
import UIKit


class EditMyPage: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var professionTextField: UITextField!
   
    @IBOutlet weak var ProfDescriptionTextView: UITextView!
   
    @IBOutlet weak var skillsTagsTextView: UITextView!
    @IBOutlet weak var addTagsButton: UIButton!
    @IBOutlet weak var minusTagsButton: UIButton!
    
    @IBOutlet weak var jobTypeTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var unitTextField: UITextField!
    @IBOutlet weak var addPriceButton: UIButton!
    @IBOutlet weak var minusPriceButton: UIButton!
    
    @IBOutlet weak var milesTextField: UITextField!
    
    //upload images outlet, do this later
    
    @IBOutlet weak var toolsTextView: UITextView!
    
    //schedule setting,
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var mFirstBeginTime: UITextField!
    @IBOutlet weak var mFirstEndTime: UITextField!
    @IBOutlet weak var mSecondBeginTime: UITextField!
    @IBOutlet weak var mSecondEndTime: UITextField!
    
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var tFirstBeginTime: UITextField!
    @IBOutlet weak var tFirstEndTime: UITextField!
    @IBOutlet weak var tSecondBeginTime: UITextField!
    @IBOutlet weak var tSecondEndTime: UITextField!
    
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var wFirstBeginTime: UITextField!
    @IBOutlet weak var wFirstEndTime: UITextField!
    @IBOutlet weak var wSecondBeginTime: UITextField!
    @IBOutlet weak var wSecondEndTime: UITextField!
   
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var thFirstBeginTime: UITextField!
    @IBOutlet weak var thFirstEndTime: UITextField!
    @IBOutlet weak var thSecondBeginTime: UITextField!
    @IBOutlet weak var thSecondEndTime: UITextField!
    
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var fFirstBeginTime: UITextField!
    @IBOutlet weak var fFirstEndTime: UITextField!
    @IBOutlet weak var fFecondBeginTime: UITextField!
    @IBOutlet weak var fFecondEndTime: UITextField!
    
    @IBOutlet weak var saturdayButton: UIButton!
    @IBOutlet weak var satFirstBeginTime: UITextField!
    @IBOutlet weak var satFirstEndTime: UITextField!
    @IBOutlet weak var satSecondBeginTime: UITextField!
    @IBOutlet weak var satSecondEndTime: UITextField!
    
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var sunFirstBeginTime: UITextField!
    @IBOutlet weak var sunFirstEndTime: UITextField!
    @IBOutlet weak var sunSecondBeginTime: UITextField!
    @IBOutlet weak var sunSecondEndTime: UITextField!
    
    
    @IBOutlet weak var saveButton: UILabel!
    @IBAction func saveTapped(_ sender: Any){
        
        
    }
    
}
