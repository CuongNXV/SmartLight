//
//  ManageListUser.swift
//  LightController
//
//  Created by Cuong Nguyen on 4/18/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ManageListUser :UIViewController, UITableViewDelegate, UITableViewDataSource {
    override func viewDidLoad() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let listUser = DataTemp.list_Username
        return listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = DataTemp.list_Username[indexPath.row]
        return cell
    }
    
}
