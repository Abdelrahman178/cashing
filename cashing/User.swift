//
//  User.swift
//  cashing
//
//  Created by Abdelrahman Amer on 14/07/2025.
//

import RealmSwift

class User: Object {
    @Persisted var name: String = ""
    @Persisted var age: Int = 0
}
