//
//  ViewController.swift
//  EagleSwap
//
//  Created by Jack Antico on 2/7/19.
//  Copyright © 2019 Jack Antico. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //For authentification
        
    }

    @IBAction func signUpPressed(_ sender: UIButton) {
        guard let email = emailField.text, !email.isEmpty else {print("Email is empty"); return}
        guard let password = passwordField.text, !password.isEmpty else {print("Password is empty"); return}
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        print("We're in signUpPressed")
        if email != "" && password != "" {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    ref.child("users").child((user?.user.uid)!).setValue(email)  //this could fuck us but hey
                    print("Login succesful with email \(email) and with password \(password)")
                    print("The database is \(ref.database)")
                    self.performSegue(withIdentifier: "toMakeProfile", sender: sender)
                } else {
                    print("Fuck something broke")
                    //self.errorLabel.text = error! as! String     need to fix this damnnit
                    print(error!)
                }
            }
        }
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        guard let email = emailField.text, let password = passwordField.text else { return}
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil {
                print("The error is this shit \(error)")
            } else {
                self.performSegue(withIdentifier: "toMarketPlace", sender: nil)
            }
        }
    }
}

