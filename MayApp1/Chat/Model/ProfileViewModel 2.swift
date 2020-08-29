//
//  ProfileViewModel.swift
//  MayApp1
//
//  Created by Eric Xiang on 7/31/20.
//  Copyright © 2020 Calvin Du. All rights reserved.
//

import Foundation

enum ProfileViewModelType {
    case info, logout
}

struct ProfileViewModel {
    let viewModelType: ProfileViewModelType
    let title: String
    let handler: (() -> Void)?
}
