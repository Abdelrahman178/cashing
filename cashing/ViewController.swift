//
//  ViewController.swift
//  cashing
//
//  Created by Abdelrahman Amer on 10/07/2025.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Sqlite file location:")
        print(FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!)
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
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else
        {
            showAlert(title: "Error", message: ".")
            return
        }

        let context = appDelegate.persistentContainer.viewContext

        guard let entity = NSEntityDescription.entity(forEntityName: "UserEntity", in: context) else {
            showAlert(title: "Error", message: "UserEntity not found in model")
            return
        }

        
        
        let userObject = NSManagedObject(entity: entity, insertInto: context)

        
        userObject.setValue(user.name, forKey: "name")
        userObject.setValue(user.age, forKey: "age")

        do {
            try context.save()
            showAlert(title: "done", message: " ✅")
            nameField.text = ""
            
             ageField.text = ""
            
        } catch {
            showAlert(title: "fail", message: " ❌")
        }
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        present(alert, animated: true)
    }

    struct User {
        var name: String
        var age: Int
    }
}
