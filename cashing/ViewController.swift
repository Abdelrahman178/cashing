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

        if let name = KeychainHelper.shared.get("userName"),
           let age = KeychainHelper.shared.get("userAge") {
            nameField.text = name
            ageField.text = age
            print("Keychain save data")
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let name = nameField.text ?? ""
        let age = ageField.text ?? ""

        KeychainHelper.shared.save(name, forKey: "userName")
        KeychainHelper.shared.save(age, forKey: "userAge")

        print("Keychain tapped ")
    }
}
