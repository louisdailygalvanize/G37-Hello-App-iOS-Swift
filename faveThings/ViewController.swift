//
//  ViewController.swift
//  faveThings
//
//  Created by Jinx on 2/22/17.
//  Copyright © 2017 Satan's Got Your Nose Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!

   
    @IBOutlet weak var firstFaveThingTextField: UITextField!
    
    @IBOutlet weak var secondFaveThingTextField: UITextField!
   
    @IBAction func submitButton(sender: AnyObject) {
        checkText()
    }
    
    func showAlert(message:String) {
        // make a new view controller (alert is a new controller)
        let alertController = UIAlertController(title: "Hello \(firstNameTextField.text!) \(lastNameTextField.text!)", message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Destructive, handler: nil)
        
        alertController.addAction(okAction)
        // show alert
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func checkText() {
        if firstNameTextField != nil && lastNameTextField != nil && firstFaveThingTextField != nil && secondFaveThingTextField != nil {
         
            showAlert("You said you like \(firstFaveThingTextField.text!) and \(secondFaveThingTextField.text!)")
        } else {
            showAlert("you did it wrong")
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            firstNameTextField.resignFirstResponder()
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            lastNameTextField.resignFirstResponder()
            firstFaveThingTextField.becomeFirstResponder()
        } else if textField == firstFaveThingTextField {
            firstFaveThingTextField.resignFirstResponder()
            secondFaveThingTextField.becomeFirstResponder()
        } else if textField == secondFaveThingTextField {
            view.endEditing(true)
            checkText()
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

