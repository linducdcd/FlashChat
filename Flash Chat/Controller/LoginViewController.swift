//
//  LoginViewController.swift
//  Flash Chat
//
//  Created by Lind Ucdcd on 5/8/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var loginPressed: UIButton!
    

}
