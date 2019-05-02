//
//  DataTemp.swift
//  LightController
//
//  Created by Cuong Nguyen on 2/15/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import Foundation

class DataTemp {
    static var domain = "https://api-smartlight.herokuapp.com"
    static var domain_command = "https://web-smartlight.herokuapp.com"
    static var token = ""
    static var isRoot = ""
    static var usernameAccount = ""
    static var fullnameAccount = ""
    static var birthdayAccount = ""
    static var phoneAccount = ""
    static var mailAccount = ""
    static var checkInfor = ""
    //Infor User
    static var numberOfHome = ""
    static var numberOfRoom = ""
    static var numberOfDevice = ""
    static var numberOfUser = ""
    static var numberOfLightOn = ""
    static var power = ""
    
    //Home
    static var homeList : Array<String> = []
    static var countHomeList = ""
    static var chooseHomeData = ""
    
    //Room
    static var roomList : Array<String> = []
    static var roomNameList : Array<String> = []
    static var chooseRoomData_id = ""
    static var chooseRoomData_name = ""
    
    //Device
    static var device_id : Array<String> = []
    static var device_location : Array<String> = []
    static var device_macAddress : Array<String> = []
    static var device_deviceType : Array<String> = []
    static var device_deviceName : Array<String> = []
    static var chooseDevice_Id = ""
    static var chooseDevice_Location = ""
    static var chooseDevice_Mac = ""
    static var chooseDevice_Name = ""
    static var chooseDevice_Type = ""
    static var valueDevice = ""
    static var statusDevice = ""
    
    //Duration
    static var startDurationData = ""
    static var endDurationData = ""
    //Database
    static var ValueLight : Array<Double> = []
    static var ValueLight_Date : Array<String> = []
    
    //command
    static var indexDevice = ""
    static var levelControl = ""
    static var CommandSuccess = ""
    static var levelLight : Array<String> = ["-1", "-1", "-1", "-1", "-1", "-1"]
    //Admin
    static var list_Username : Array<String> = []
    static var list_Fullname : Array<String> = []
    static var list_Email : Array<String> = []
    static var list_Phone : Array<String> = []
    static var list_Birthday : Array<String> = []
}
