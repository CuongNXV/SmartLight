//
//  ControlDevice.swift
//  LightController
//
//  Created by Cuong Nguyen on 4/10/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var controlData = ["aaaa", "abc", "bbbbbbb"]
class ControlDevice: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var btnControl: UIButton!
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let countDevice = DataTemp.device_location
        return countDevice.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellControlLight
        cell?.location.text = "Vị trí " + DataTemp.device_location[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataTemp.indexDevice = String(indexPath.row)
        let index = Int(DataTemp.indexDevice)
        DataTemp.chooseDevice_Mac = DataTemp.device_macAddress[index!]
        DataTemp.chooseDevice_Location = DataTemp.device_location[index!]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
