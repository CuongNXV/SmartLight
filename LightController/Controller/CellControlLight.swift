//
//  CellControlLight.swift
//  LightController
//
//  Created by Cuong Nguyen on 4/19/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class CellControlLight: UITableViewCell {
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var numberDevice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func levelLight(_ sender: UISlider) {
        let valueDevice = Int(sender.value) * 20
        DataTemp.levelControl = String(valueDevice)
        numberDevice.text = DataTemp.levelControl
        let indextt = (DataTemp.chooseDevice_Location as NSString).integerValue
        DataTemp.levelLight[indextt] = DataTemp.levelControl
        if (DataTemp.levelControl == "-20"){
            DataTemp.levelControl = "0"
            numberDevice.text = "Mức độ sáng của đèn"
            let indextttt = (DataTemp.chooseDevice_Location as NSString).integerValue
            
            DataTemp.levelLight[indextttt] = DataTemp.levelControl
        }
    }
    
    @IBAction func commandLight(_ sender: Any) {
        let param: Parameters = [
            "room_name" : DataTemp.chooseRoomData_name,
            "home_id" : DataTemp.chooseHomeData,
            "device_type" : "lighting_device",
            "level" : DataTemp.levelControl,
            "switch_code" : "1",
            "device_id" : DataTemp.chooseDevice_Mac
        ]
        print(param)
        let url : String = DataTemp.domain + "/api/data/command?token=" + DataTemp.token
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: [:]).responseJSON { (response) in
            switch response.result {
                
            case .success(let data):
                print("error")
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
