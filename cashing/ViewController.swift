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
        
        if let fileURL = Realm.Configuration.defaultConfiguration.fileURL {
            print("📦 Realm file location:\n\(fileURL)")
            
        }
    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let user = User()
        user.name = nameField.text ?? ""
        user.age = Int(ageField.text ?? "") ?? 0

        let realm = try! Realm()
        try! realm.write {
            realm.add(user)
        }

        print("Saved user: \(user.name), age: \(user.age)")
    }
}
