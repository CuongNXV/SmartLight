//
//  Account.swift
//  LightController
//
//  Created by Cuong Nguyen on 2/15/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Account : UIViewController{

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var fullname: UILabel!
    @IBOutlet weak var birthday: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var mail: UILabel!
    
    override func viewDidLoad() {
        customeBox()
        getInformationAccount()
    }
    func getInformationAccount() {
        let tokenDetail = DataTemp.token
        let urlAccount: String = DataTemp.domain + "/api/users?token=" + tokenDetail
        //print(urlAccount)
        Alamofire.request(urlAccount).responseJSON{
            (response) in
            switch response.result {
            case .success(let data):
                let arrayDataAccount = JSON(data)
                let account = arrayDataAccount["data"].arrayValue
                let accountTemp = JSON(account[0])
                let fullnameAccount = accountTemp["fullname"].stringValue
                let birthdayAccount = accountTemp["birthday"].stringValue
                let phoneAccount = accountTemp["phone_number"].stringValue
                let mailAccount = accountTemp["email"].stringValue
                self.username.text = "         " + DataTemp.usernameAccount
                self.fullname.text = "         " + fullnameAccount
                self.birthday.text = "         " + birthdayAccount
                self.phone.text = "         " + phoneAccount
                self.mail.text = "         " + mailAccount
            case .failure(let error):
                print(error)
            }
        }
    }
    func customeBox(){
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor.black.cgColor
        username.layer.cornerRadius = 15
        username.clipsToBounds = true
        
        fullname.layer.borderWidth = 1
        fullname.layer.borderColor = UIColor.black.cgColor
        fullname.layer.cornerRadius = 15
        fullname.clipsToBounds = true
        
        birthday.layer.borderWidth = 1
        birthday.layer.borderColor = UIColor.black.cgColor
        birthday.layer.cornerRadius = 15
        birthday.clipsToBounds = true
        
        phone.layer.borderWidth = 1
        phone.layer.borderColor = UIColor.black.cgColor
        phone.layer.cornerRadius = 15
        phone.clipsToBounds = true
        
        mail.layer.borderWidth = 1
        mail.layer.borderColor = UIColor.black.cgColor
        mail.layer.cornerRadius = 15
        mail.clipsToBounds = true
    }
}

