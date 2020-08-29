//
//  SpanishViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/2/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit
class SpanishViewController: UIViewController{
    

    @IBOutlet weak var spanishView: UIView!
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        spanishView.layer.cornerRadius = 20
        spanishView.layer.masksToBounds = true
    }
}
