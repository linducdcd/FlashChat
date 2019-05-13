//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Lind Ucdcd on 5/8/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    // Declare instance varibles
    var messageArray : [Message] = [Message]()
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var messageTextfield: UITextField!
    @IBOutlet weak var messageTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    
    
    //MARK: action Button
    
    @IBAction func sendPressed(_ sender: Any) {
        messageTextfield.endEditing(true)
        
        //TODO: send Message to Firebase and sending to our Database
        
        messageTextfield.isEnabled = false
        sendButton.isEnabled = false
        
        let messagesDB = Database.database().reference().child("Messages")
        
        let messageDictionary = ["Sender": Auth.auth().currentUser?.email, "MessageBody" : messageTextfield.text!]
        
        messagesDB.childByAutoId().setValue(messageDictionary) {
            (error, refrence) in
            if error != nil {
                print(error!)
            } else {
                print("message Saved Successfully")
                self.messageTextfield.isEnabled = true
                self.sendButton.isEnabled = true
                self.messageTextfield.text = ""
                
            }
        }
        
    }
        //TODO: create the retrieveMessages Method
        
        func retrieveMessages() {
            
            let messagesDB = Database.database().reference().child("Messages")
            
            messagesDB.observe(.childAdded) { (snapshot) in
                
                let snapshotValue = snapshot.value as! Dictionary<String,String>
                let text = snapshotValue["MessageBody"]
                let sender = snapshotValue["Sender"]
                let messageClass = Message()
                //print(text,sender)
                messageClass.messageBody = text!
                messageClass.sender = sender!
                self.messageArray.append(messageClass)
                self.configureTableView()
                self.messageTableView.reloadData()
                
            }
            
        }
        
        
    
    
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
        retrieveMessages()
        
        messageTableView.separatorStyle = .singleLine

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //MARK: - tableView DataSource Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        
        cell.messageBody.text = messageArray[indexPath.row].messageBody
        cell.senderUserName.text = messageArray[indexPath.row].sender
        cell.avatorImagrView.image = UIImage(named: "egg")
        
//        let messageArray = ["first, Hi" , "secvcvvbvcbcvbvcbcvbcvbcvbcvbond" , "third"]
//        cell.messageBody.text = messageArray[indexPath.row]
        
        if cell.senderUserName.text == Auth.auth().currentUser?.email as String? {
            
            cell.avatorImagrView.backgroundColor = UIColor.flatMint()
            cell.messageBackground.backgroundColor = UIColor.flatSkyBlue()
            
        }else{
            
            cell.avatorImagrView.backgroundColor = UIColor.flatWatermelon()
            cell.messageBackground.backgroundColor = UIColor.flatGray()
            
        }
        
        
        
        
        
        return cell
        
    }
    
    //TODO: Delclare numberOfRowInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
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
