//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Lind Ucdcd on 5/8/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    
    
    
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
        
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        //TODO: Set yourself at the delagate of the text field
        
        messageTextfield.delegate = self
        
        //TODO: set the tapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapGesture)
        
        //TODO: Register MessageCell.xib
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK: - tableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        let messageArray = ["first, Hi" , "secvcvvbvcbcvbvcbcvbcvbcvbcvbond" , "third"]
        cell.messageBody.text = messageArray[indexPath.row]
        return cell
        
    }
    
    //TODO: Delclare numberOfRowInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    //TODO: Declare tableViewTapped
    @objc func tableViewTapped() {
        
        messageTextfield.endEditing(true)
    }
    
    
    
    
    
    //TODO: Declare configureTableView
    func configureTableView () {
        messageTableView.rowHeight = UITableViewAutomaticDimension
        messageTableView.estimatedRowHeight = 120.0
        
    }
    
    
    //TODO: Declare textFieldDidEndingEditing
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.16) {
            self.heightConstraint.constant = 50
            self.view.layoutIfNeeded()
        }    }

    //TODO: Declare textFieldDidBeginingEditing

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        UIView.animate(withDuration: 0.16) {
            self.heightConstraint.constant = 308
            self.view.layoutIfNeeded()
        }
    }
}
