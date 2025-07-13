//
//  UserModel.swift
//  cashing
//
//  Created by Abdelrahman Amer on 13/07/2025.
//

import Foundation

@Model
class User {
    var name: String
    var age: Int

    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
}

