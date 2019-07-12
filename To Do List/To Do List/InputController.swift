//
//  ViewController.swift
//  To Do List
//
//  Created by GWC on 7/11/19.
//  Copyright © 2019 GWC. All rights reserved.
//
import CoreData
import UIKit

class InputController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputFill: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        inputFill.delegate = self
    }
    
    
    @IBAction func submitTask(_ sender: Any) {
        
        guard inputFill.text != "" else{ return }
        
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        
        let newTask = Task(context: context)
        newTask.name = inputFill.text
        
        delegate.saveContext()
        
        inputFill.text = ""
        view.endEditing(true)
        
        
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}




