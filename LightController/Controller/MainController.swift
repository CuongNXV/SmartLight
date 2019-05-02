//
//  ViewController.swift
//  LightController
//
//  Created by Cuong Nguyen on 2/15/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var loadingLogin: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        username.delegate = self
        password.delegate = self
        loadingLogin.isHidden = true
        customeBox()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func btnLogin_Clicked(_ sender: Any) {
        let param: Parameters = [
            "username" : username.text!,
            "password" : password.text!
        ]
        DataTemp.usernameAccount = username.text!
        let url : String = DataTemp.domain + "/api/auth/login" 
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            switch response.result {
            
            case .success(let data):
                let arrayJSON = JSON(data)
                DataTemp.token = arrayJSON["token"].stringValue
                DataTemp.isRoot = arrayJSON["isRoot"].stringValue
                let check = arrayJSON["success"].boolValue
                if (check){
                    //self.loadingLogin.isHidden = true
                    self.performSegue(withIdentifier: "segueHomeToTab", sender: self)
                    self.getInforUser()
                } else {
                    self.creatAlert(title: "Thông Báo", message: "Bạn đã nhập sai Username hoặc Password")
                    print("fail")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueHomeToTab") {
            let destination = segue.destination as! TabController
            
        }
    }
    func customeBox(){
        username.layer.borderWidth = 1
        username.layer.borderColor = UIColor.black.cgColor
        username.layer.cornerRadius = 20
        username.clipsToBounds = true
        
        password.layer.borderWidth = 1
        password.layer.borderColor = UIColor.black.cgColor
        password.layer.cornerRadius = 20
        password.clipsToBounds = true
        
        btnLogin.layer.cornerRadius = 20
        btnLogin.clipsToBounds = true
    }
    func creatAlert(title:String, message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func getInforUser(){
        let tokenDetail = DataTemp.token
        let urlDataUser = DataTemp.domain + "/api/users/info?token=" + tokenDetail
        print(urlDataUser)
        Alamofire.request(urlDataUser).responseJSON{
            (response) in
            switch response.result {
            case .success(let data):
                let arrayDataUser = JSON(data)
                DataTemp.checkInfor = arrayDataUser["success"].stringValue
                DataTemp.numberOfHome = arrayDataUser["numberOfHome"].stringValue
                DataTemp.numberOfRoom = arrayDataUser["numberOfRoom"].stringValue
                DataTemp.numberOfDevice = arrayDataUser["numberOfDevice"].stringValue
                DataTemp.numberOfUser = arrayDataUser["numberOfUser"].stringValue
                DataTemp.numberOfLightOn = arrayDataUser["numberOfTurnOnLight"].stringValue
                DataTemp.power = arrayDataUser["powerConsumption"].stringValue
            case .failure(let error):
                print(error)
            }
        }
    }
}

