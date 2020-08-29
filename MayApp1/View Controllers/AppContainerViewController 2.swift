//
//  AppContainerViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/24/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit
class AppContainerViewController: UIViewController{
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        AppManager.shared.appContainer = self
        AppManager.shared.showApp(elf: self)
    }
    
}
