//
//  DatabaseManager.swift
//  MayApp1
//
//  Created by Eric Xiang on 7/13/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation
import FirebaseDatabase

final class DataBaseManager{
    static let shared = DataBaseManager()
    private let database = Database.database().reference()
    static func safeEmail(emailAddress: String) -> String{
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
}

//Account Managementsdfasdf

extension DataBaseManager{
    public func userExists(with email: String, completion: @escaping((Bool) -> Void)){
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        database.child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            guard snapshot.value as? String != nil else{
                completion(false)
                return
            }
            completion(true)
        })
    }
    /// Inserting new user to database
    public func insertUser(user: AppUser, completion: @escaping (Bool) -> Void){
        database.child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            ], withCompletionBlock: { error, _ in
                guard error == nil else{
                    print("failed to write to databse")
                    completion(false)
                    return
                }
                completion(true)
            })
                        
    }
                

struct AppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    var profilePictureFileName: String{
        return "\(safeEmail)_profile_picture.png"
    }
    }
}
