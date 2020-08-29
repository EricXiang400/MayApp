//
//  EnglishViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/2/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit

class EnglishViewController: UIViewController{
    
    @IBOutlet weak var englishView: UIView!
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        englishView.layer.cornerRadius = 20
        englishView.layer.masksToBounds = true
    }
    
}
