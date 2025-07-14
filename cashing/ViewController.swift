//
//  ViewController.swift
//  cashing
//
//  Created by Abdelrahman Amer on 10/07/2025.
//
import UIKit

import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getUser() -> User {
        let user = User()
        user.name = nameField.text ?? ""
        user.age = Int(ageField.text ?? "") ?? 0
        return user
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let user = getUser()
        saveUser(user)
    }
    
    func saveUser(_ user: User) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(user)
            }
            print("User saved to Realm.")
        } catch {
            print("Error saving user: \(error)")
        }
    }
}
