//
//  TabController.swift
//  LightController
//
//  Created by Cuong Nguyen on 2/15/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TabController: UITabBarController {
    var dataTemp :Array<String> = []
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        getDataHome()
    }
    //Get home
    func getDataHome(){
        let tokenDetail = DataTemp.token
        let urlDataHome = DataTemp.domain + "/api/data?token=" + tokenDetail
        //print(urlDataHome)
        Alamofire.request(urlDataHome).responseJSON{
            (response) in
            switch response.result {
            case .success(let data):
                let arrayDataHome = JSON(data)
                let home = arrayDataHome["data"].arrayValue

                let countHome = home.count
                for i in 0..<countHome {
                    DataTemp.homeList += [home[i]["home_id"].stringValue]
                    print(DataTemp.homeList)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    


}
