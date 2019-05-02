//
//  ControlLight.swift
//  LightController
//
//  Created by Cuong Nguyen on 4/9/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

var datatemp1 = ["aaaa", "bbbbbb", "aaaaabbbbb"]
class ControlLight : UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let roomlist = DataTemp.roomNameList
        return datatemp1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = DataTemp.roomNameList[indexPath.row]
        return cell
    
    }
}
