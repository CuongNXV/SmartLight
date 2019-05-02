//
//  ChangePassword.swift
//  LightController
//
//  Created by Cuong Nguyen on 3/13/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ChangePassword : UIViewController{
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var old_password: UITextField!
    @IBOutlet weak var new_password: UITextField!
    @IBOutlet weak var btn_save: UIButton!
    
    override func viewDidLoad() {
        customeBox()
        username.text = DataTemp.usernameAccount
    }
    func changePass(){
    }
    @IBAction func button_save(_ sender: Any) {
    }
    func customeBox(){
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor.black.cgColor
        username.layer.cornerRadius = 15
        username.clipsToBounds = true
        
        old_password.layer.borderWidth = 1
        old_password.layer.borderColor = UIColor.black.cgColor
        old_password.layer.cornerRadius = 15
        old_password.clipsToBounds = true
        
        new_password.layer.borderWidth = 1
        new_password.layer.borderColor = UIColor.black.cgColor
        new_password.layer.cornerRadius = 15
        new_password.clipsToBounds = true
        
        btn_save.layer.borderWidth = 1
        btn_save.layer.borderColor = UIColor.black.cgColor
        btn_save.layer.cornerRadius = 20
        btn_save.clipsToBounds = true
    }
}
