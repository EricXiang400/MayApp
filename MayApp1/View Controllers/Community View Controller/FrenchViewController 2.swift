//
//  FrenchViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/2/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit

class FrenchViewController: UIViewController{
    
    @IBOutlet weak var frenchView: UIView!
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        frenchView.layer.cornerRadius = 20
        frenchView.layer.masksToBounds = true
    }
}
