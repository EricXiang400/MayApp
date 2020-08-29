//
//  AppManager.swift
//  MayApp1
//
//  Created by Eric Xiang on 6/24/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AppManager{
    static let shared = AppManager()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var appContainer: AppContainerViewController!
    private init(){ }
    
    func showApp(elf: AppContainerViewController){
        if Auth.auth().currentUser == nil{
            let viewController = elf.storyboard?.instantiateViewController(identifier: Constants.Storyboard.LogInViewController) as? UINavigationController
            
            elf.view.window?.rootViewController = viewController
            elf.view.window?.makeKeyAndVisible()
            
        }else{
            let viewController = elf.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UITabBarController
                       
            elf.view.window?.rootViewController = viewController
            elf.view.window?.makeKeyAndVisible()        }
        
       // appContainer.present(viewController, animated: true, completion: nil)
    }
    func logout(elf: ProfileViewController){
        try! Auth.auth().signOut()
        let viewController = elf.storyboard?.instantiateViewController(identifier: "LogInViewController") as? UINavigationController
                   
        elf.view.window?.rootViewController = viewController
        elf.view.window?.makeKeyAndVisible()
    }
}
