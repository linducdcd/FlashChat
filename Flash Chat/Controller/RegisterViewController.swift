//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Lind Ucdcd on 5/8/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    
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
    @IBAction func registerPressed(_ sender: Any) {
        
        
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) {
            (user, error) in
            if error != nil {
                print(error!)
            } else {
                
                SVProgressHUD.dismiss()
                
                print("Registration Successful!")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
    }
    
    

}
