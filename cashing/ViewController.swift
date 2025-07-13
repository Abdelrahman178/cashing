//
//  ViewController.swift
//  cashing
//
//  Created by Abdelrahman Amer on 10/07/2025.
//

import UIKit
import SwiftData

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!

    var context: ModelContext?

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
            print("❌ SwiftData ")
            return
        }

        // Delete the old data
        
        let descriptor = FetchDescriptor<User>()
        if let allUsers = try? context.fetch(descriptor) {
            for oldUser in allUsers {
                context.delete(oldUser)
            }
        }

        //Save user data
        context.insert(user)
        print("✅ SwiftData")
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
