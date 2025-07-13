//
//  ViewController.swift
//  cashing
//
//  Created by Abdelrahman Amer on 10/07/2025.
//

import UIKit
import Swift

class User {
    var name: String
    var age: Int
    
    init(name: String = "", age: Int = 0) {
        self.name = name
        self.age = age
    }
}

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUser()

    }
    
    func getUser() -> User {
        let name = nameField.text ?? ""
        let age = Int(ageField.text ?? "") ?? 0
        return User(name: name, age: age)
    }
    

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let user = getUser()
        
        saveUser(user)
    }
   
    func saveUser(_ user: User) {
        guard let context = context else {
            print("❌ No SwiftData context found")
            return
        }

        let descriptor = FetchDescriptor<User>()
        if let allUsers = try? context.fetch(descriptor) {
            for u in allUsers {
                context.delete(u)
            }
        }

        // نحفظ الجديد
        context.insert(user)
        print("✅ Saved user using SwiftData")
    }
    
    // Basic struct for passing user data
    struct User {
        var name: String
        var age: Int
    }
    
    
    func loadUser() {
        guard let context = context else { return }

        let descriptor = FetchDescriptor<User>()
        if let allUsers = try? context.fetch(descriptor), let last = allUsers.last {
            nameField.text = last.name
            ageField.text = String(last.age)
        }
    }

}
