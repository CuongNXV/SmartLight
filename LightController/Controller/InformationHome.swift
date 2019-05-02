//
//  InformationHome.swift
//  LightController
//
//  Created by Cuong Nguyen on 2/24/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Charts

class InformationHome : UIViewController {
    @IBOutlet weak var numberOfHome: UIView!
    @IBOutlet weak var numberOfRoom: UIView!
    @IBOutlet weak var numberOfDevice: UIView!
    @IBOutlet weak var lightOn: UIView!
    @IBOutlet weak var power: UIView!
    
    @IBOutlet weak var numberHome: UILabel!
    @IBOutlet weak var numberRoom: UILabel!
    @IBOutlet weak var numberDevice: UILabel!
    @IBOutlet weak var numberLightOn: UILabel!
    @IBOutlet weak var numberPower: UILabel!
    
    
    override func viewDidLoad() {
        customeBox()
        numberHome.text = DataTemp.numberOfHome
        numberRoom.text = DataTemp.numberOfRoom
        numberDevice.text = DataTemp.numberOfDevice
        numberLightOn.text = DataTemp.numberOfLightOn
        numberPower.text = DataTemp.power + "W"
        
    }
    func customeBox(){
        numberOfHome.layer.borderWidth = 1
        numberOfHome.layer.borderColor = UIColor.black.cgColor
        numberOfHome.layer.cornerRadius = 20
        numberOfHome.clipsToBounds = true
        
        numberOfRoom.layer.borderWidth = 1
        numberOfRoom.layer.borderColor = UIColor.black.cgColor
        numberOfRoom.layer.cornerRadius = 20
        numberOfRoom.clipsToBounds = true
        
        numberOfDevice.layer.borderWidth = 1
        numberOfDevice.layer.borderColor = UIColor.black.cgColor
        numberOfDevice.layer.cornerRadius = 20
        numberOfDevice.clipsToBounds = true
        
        lightOn.layer.borderWidth = 1
        lightOn.layer.borderColor = UIColor.black.cgColor
        lightOn.layer.cornerRadius = 20
        lightOn.clipsToBounds = true
        
        power.layer.borderWidth = 1
        power.layer.borderColor = UIColor.black.cgColor
        power.layer.cornerRadius = 20
        power.clipsToBounds = true
    }
}
