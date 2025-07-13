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
    
    struct User: Codable {
        var name: String
        var age: Int
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
    
    func getFilePath() -> URL? {
        let fileManager = FileManager.default
        guard let docs = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        return docs.appendingPathComponent("user.json")
    }
    
    func saveUser(_ user: User) {
        guard let url = getFilePath() else { return }
        do {
            let data = try JSONEncoder().encode(user)
            try data.write(to: url)
            print("✅ Saved to file: \(url)")
        } catch {
            print("❌ Error saving user: \(error)")
        }
    }
    
    func loadUser() {
        guard let url = getFilePath() else { return }
        do {
            let data = try Data(contentsOf: url)
            let user = try JSONDecoder().decode(User.self, from: data)
            nameField.text = user.name
            ageField.text = String(user.age)
            print("✅ Loaded user: \(user.name), \(user.age)")
        } catch {
            print("ℹ️ No saved user found or error decoding.")
        }
    }
}
