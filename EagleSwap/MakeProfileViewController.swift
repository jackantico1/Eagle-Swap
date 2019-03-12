//
//  MakeProfileViewController.swift
//  EagleSwap
//
//  Created by Jack Antico on 3/3/19.
//  Copyright © 2019 Jack Antico. All rights reserved.
//

import UIKit
import Firebase

class MakeProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var gradeField: UITextField!
    @IBOutlet weak var typeField: UISegmentedControl!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var dormRoomField: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let listOfDorms = ["CLXF", "Gonzaga and Fitzpatrick", "Kostaka", "Shaw House", "Cheverus", "Williams", "Welch", "Roncallei", "Ignacio", "Voutee", "Rubinstein", "Gabelli", "Mods", "Ninety", "66", "Stayer", "Walsh", "Vanderslice", "2150", "GreyCliff", "2k", "Cushing", "Harding", "Duschene", "Keyes"]
    }
    
    @IBAction func nameFieldChanged(_ sender: UITextField) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let key = ref.child("names").childByAutoId().key
        guard let userKey = Auth.auth().currentUser?.uid else {return}
        
        ref.child("names").child(userKey).observeSingleEvent(of: .value) { (snapshot) in
            var count = "0"
            if let values = snapshot.value as? [String] {
                  count = String(describing: values.count)
            }
            var newName = [String()]
            print("The count is this shit \(count)")
            
        }
    }
    
    @IBAction func gradeFieldChanged(_ sender: UITextField) {
    }
    
    @IBAction func typeFieldChanged(_ sender: UISegmentedControl) {
    }
    
    
    @IBAction func amountFieldChanged(_ sender: UITextField) {
    }
    
    @IBOutlet weak var dormRoomFieldChanged: UITableView!
    
    
}

//extension MakeProfileViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = mealItems[indexPath.row]
//        cell.backgroundColor = UIColor.init(red: 148.0/256.0, green: 23.0/256.0, blue: 81.0/256.0, alpha: 1.0)
//        cell.textLabel?.textColor = UIColor.init(red: 255.0/256.0, green: 251.0/256.0, blue: 0.0/256.0, alpha: 1.0)
//        return cell
//    }
//
//}
