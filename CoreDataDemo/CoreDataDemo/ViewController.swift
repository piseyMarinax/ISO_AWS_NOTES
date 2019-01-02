//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by mp001 on 8/12/18.
//  Copyright © 2018 mp001. All rights reserved.
//

import UIKit

class ViewController: UIViewController,

UITableViewDelegate, UITableViewDataSource {
    
   
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var contacts = [Contact]()

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        return cell
    }
    
    func getAllContacts()
    {
//        contacts = try! contacts
    }
    

}

