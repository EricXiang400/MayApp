//
//  CalcSearchViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/2/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit

class CalcSearchViewController: UIViewController{
    
    @IBOutlet weak var calcQuestion: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcQuestion.layer.cornerRadius = 20.0
        calcQuestion.layer.masksToBounds = true
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
