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
        let folderPath = "/Users/bedo33352icloud.com/Desktop/system file save"
        let filePath = folderPath + "/user.json"

        let folderURL = URL(fileURLWithPath: folderPath)
        let fileURL = URL(fileURLWithPath: filePath)

        if !FileManager.default.fileExists(atPath: folderPath) {
            do {
                try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
            } catch {
                print("❌ Failed to create directory: \(error)")
                return nil
            }
        }

        return fileURL
    }

    func saveUser(_ user: User) {
        guard let url = getFilePath() else { return }
        do {
            let data = try JSONEncoder().encode(user)
            try data.write(to: url)
            print("✅ Saved to file: \(url.path)")
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
            print("✅ Loaded user from file")
        } catch {
            print("ℹ️ No saved user found or failed to decode: \(error)")
        }
    }
}
