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
        //not implemented
    }

    
    // Basic struct for passing user data
    struct User {
        var name: String
        var age: Int
    }
}
