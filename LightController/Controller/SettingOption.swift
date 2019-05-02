//
//  SettingOption.swift
//  LightController
//
//  Created by Cuong Nguyen on 3/29/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SettingOption : UIViewController {
    override func viewDidLoad() {
        
    }
    
    @IBAction func Admin(_ sender: Any) {
        if (DataTemp.isRoot == "T") {
//            self.performSegue(withIdentifier: "segueToManage", sender: self)
            getListUser()
        } else {
            print("A")
        }
    }
    func getListUser(){
        let tokenDetail = DataTemp.token
        let urlDataListUser = DataTemp.domain + "/api/users/list_user?token=" + tokenDetail
        Alamofire.request(urlDataListUser).responseJSON{
            (response) in
            switch response.result {
            case .success(let data):
                let arrayDataListUser = JSON(data)
                let listUser = arrayDataListUser["data"].arrayValue
                
                let countUser = listUser.count
                for i in 0..<countUser {
                    DataTemp.list_Username += [listUser[i]["username"].stringValue]
                }
                for i in 0..<countUser {
                    DataTemp.list_Fullname += [listUser[i]["fullname"].stringValue]
                }
                for i in 0..<countUser {
                    DataTemp.list_Birthday += [listUser[i]["birthday"].stringValue]
                }
                for i in 0..<countUser {
                    DataTemp.list_Phone += [listUser[i]["phone_number"].stringValue]
                }
                for i in 0..<countUser {
                    DataTemp.list_Email += [listUser[i]["email"].stringValue]
                }
                self.performSegue(withIdentifier: "segueHomeToRoom", sender: self)
            //print(DataTemp.roomNameList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
