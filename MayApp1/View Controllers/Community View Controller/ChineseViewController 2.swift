//
//  ChineseViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/2/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit

class ChineseViewController: UIViewController{
    
    
    @IBOutlet weak var ChineseView: UIView!
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ChineseView.layer.cornerRadius = 20.0
        ChineseView.layer.masksToBounds = true
    }
    
}
