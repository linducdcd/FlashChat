//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Lind Ucdcd on 5/8/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    
    @IBAction func logOutPressed(_ sender: Any) {
        //TODO: Logout user and send to welcom screen
        do {
        try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print("error, there was some problem to signOut")
        }
            
            
            
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    

    

}
