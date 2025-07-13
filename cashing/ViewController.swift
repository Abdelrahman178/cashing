//
//  ViewController.swift
//  cashing
//
//  Created by Abdelrahman Amer on 10/07/2025.
//

import UIKit

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
    
    func loadUser() {
        let name = UserDefaults.standard.string(forKey: "name") ?? ""
        let age = UserDefaults.standard.integer(forKey: "age")
        nameField.text = name
        ageField.text = "\(age)"
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let user = getUser()
        
        saveUser(user)
    }
    
    func saveUser(_ user: User) {
        UserDefaults.standard.set(user.name, forKey: "name")
        UserDefaults.standard.set(user.age, forKey: "age")
        print("✅ Saved to UserDefaults")
    }

    
    // Basic struct for passing user data
    struct User {
        var name: String
        var age: Int
    }
}
