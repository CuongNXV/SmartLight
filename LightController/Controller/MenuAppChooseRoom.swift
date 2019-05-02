//
//  MenuAppChooseRoom.swift
//  LightController
//
//  Created by Cuong Nguyen on 4/8/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var datatemp = ["sadfsfasdf","fegdfbdb","vdfvdfv","vsdfsdv"]
class MenuAppChooseRoom : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        self.loading.isHidden = true
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let roomlist = DataTemp.roomNameList
        return roomlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellroom", for: indexPath) as? CellChooseRoom
        cell?.NameRoom.text = DataTemp.roomNameList[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let myIndex = indexPath.row
        DataTemp.chooseRoomData_name = DataTemp.roomNameList[myIndex]

        let countRoom = DataTemp.roomNameList.count
        var key = 0
        for i in 0..<countRoom{
            if (DataTemp.roomNameList[i] == DataTemp.chooseRoomData_name){
                key = i
            }
        }
        DataTemp.chooseRoomData_id = DataTemp.roomList[key]
        getDataDevice()
    }
    func getDataDevice(){
        let tokenDetail = DataTemp.token
        let urlDataDevice = DataTemp.domain + "/api/data/home/" + DataTemp.chooseHomeData + "/room/" +  DataTemp.chooseRoomData_id + "/device_type/device_lighting?" + "token=" + tokenDetail
        print(urlDataDevice)
        Alamofire.request(urlDataDevice).responseJSON{
            (response) in
            switch response.result {
            case .success(let data):
                let arrayDataDevice = JSON(data)
                let device = arrayDataDevice["data"].arrayValue
                let check = arrayDataDevice["success"].stringValue
                let countRoom = device.count
                for i in 0..<countRoom {
                    DataTemp.device_id += [device[i]["device_id"].stringValue]
                }
                for i in 0..<countRoom {
                    DataTemp.device_deviceName += [device[i]["device_name"].stringValue]
                }
                for i in 0..<countRoom {
                    DataTemp.device_macAddress += [device[i]["mac_address"].stringValue]
                }
                for i in 0..<countRoom {
                    DataTemp.device_location += [device[i]["location"].stringValue]
                }
                print(DataTemp.device_location)
                if (check == "true"){
                    self.performSegue(withIdentifier: "segueRoomToDevice", sender: self)
                } 
            case .failure(let error):
                print(error)
            }
        }
    }

}
