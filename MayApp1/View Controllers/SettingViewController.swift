//
//  SettingViewController.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/2/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit

class SettingViewController: UIViewController{
   @IBOutlet weak var profileImage: UIImageView!
   
    override func viewDidLoad() {
             super.viewDidLoad()
             
         guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
          let url = URL(string: urlString) else {
              return
          }
         
        let task =  URLSession.shared.dataTask(with: url, completionHandler: { data, _, error in
              guard let data = data, error == nil else {
                  return
              }
             
              DispatchQueue.main.async {
              let pickedImage = UIImage(data: data)
                  self.profileImage.image = pickedImage
              }
          })
          task.resume()
    }
}
