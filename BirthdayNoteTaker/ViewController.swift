//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by cem bayat on 15.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTexField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if let newName = storedName as? String {
            nameLabel.text = ("Name : \(newName)")
        }
        
        if let newBirthday = storedBirthday as? String{
            birthdayLabel.text = ("Birthday : \(newBirthday)")
        }
        
    }

    @IBAction func saveBtnClicked(_ sender: Any) {
        
        UserDefaults.standard.setValue(nameTextField.text!, forKey: "name")
        UserDefaults.standard.setValue(birthdayTexField.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        
        nameLabel.text = ("Name : \(nameTextField.text!)")
        birthdayLabel.text = ("Birthday : \(birthdayTexField.text!)")
        
    }
    
    
    @IBAction func deleteBtnClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name :"
        }
        
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday : "
        }
        
    }
    
   //klavyeyi kapatmak için
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

