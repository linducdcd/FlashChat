//
//  LoginViewController.swift
//  Flash Chat
//
//  Created by Lind Ucdcd on 5/8/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    
    //MARK: - Pre-Linked IBOutlets

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //MARK: - action Button
    
    @IBAction func loginPressed(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print("login Error: \(String(describing: error))")

            } else {
                print("Log In Successfull")
             self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
}
