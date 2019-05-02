//
//  MenuAppChooseHome.swift
//  LightController
//
//  Created by Cuong Nguyen on 4/8/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class MenuAppChooseHome : UIViewController, UITableViewDataSource, UITableViewDelegate{
    override func viewDidLoad() {
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let listHome = DataTemp.homeList
        return listHome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellhome", for: indexPath) as? CellChooseHome
        cell?.NameHome.text = "Home" + DataTemp.homeList[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myIndex = indexPath.row
        DataTemp.chooseHomeData = DataTemp.homeList[myIndex]
        getDataRoom()
    }
    func getDataRoom(){
        let tokenDetail = DataTemp.token
        let urlDataHome = DataTemp.domain + "/api/data/home/" + DataTemp.chooseHomeData + "?token=" + tokenDetail
        Alamofire.request(urlDataHome).responseJSON{
            (response) in
            switch response.result {
            case .success(let data):
                let arrayDataRoom = JSON(data)
                let room = arrayDataRoom["data"].arrayValue
                
                let countRoom = room.count
                for i in 0..<countRoom {
                    DataTemp.roomNameList += [room[i]["room_name"].stringValue]
                }
                for i in 0..<countRoom {
                    DataTemp.roomList += [room[i]["room_id"].stringValue]
                }
                self.performSegue(withIdentifier: "segueHomeToRoom", sender: self)
            //print(DataTemp.roomNameList)
            case .failure(let error):
                print(error)
            }
        }
    }

}
