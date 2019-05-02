//
//  GetDataFromDatabase.swift
//  LightController
//
//  Created by Cuong Nguyen on 2/17/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Charts

class GetDataFromDatabase : UIViewController {
    
    @IBOutlet weak var startTimeData: UITextField!
    @IBOutlet weak var endTimeData: UITextField!
    
    @IBOutlet weak var getData: UIButton!
    
    @IBOutlet weak var lineChartView: LineChartView!
    private var StartDatePicker : UIDatePicker?
    private var EndDataPicker : UIDatePicker?


    override func viewDidLoad() {
        customeBox()
        startDuration()
        endDuration()
        
    }
    @IBAction func btn_getData(_ sender: Any) {
  //        getDataFromDataBase()
//        thang = ["hai","ba","bon","nam","sau"]
//        let giatri : Array<Double> = [20,10,40,56,5]
//        setLineChart(name: thang, values: giatri)
    }
    func getDataFromDataBase(){
        let tokenDetail = DataTemp.token
        let urlDataHome = "https://k61iotlab.ddns.net:3001/api/data/home/" + DataTemp.chooseHomeData + "/room/1/device_type/lighting_device/device_id/b4:e6:2d:28:e6:9f-1/type/db?token=" + tokenDetail + "&start_duration=" + DataTemp.startDurationData + "T19:52:00&end_duration=" + DataTemp.endDurationData + "T22:39:00"
        //print(urlDataHome)
        Alamofire.request(urlDataHome).responseJSON{
            (response) in
            switch response.result {
            case .success(let data):
                let arrayDataRoom = JSON(data)
                let dataHome = arrayDataRoom["data2"].arrayValue
                let countData = dataHome.count
               
                for i in 0..<countData {
                    DataTemp.ValueLight += [dataHome[i]["illuminance_level"].doubleValue]
                }
                 print(DataTemp.ValueLight)
                
                for i in 0..<countData {
                    DataTemp.ValueLight_Date += [dataHome[i]["coming_time"].stringValue]
                }
                print(DataTemp.ValueLight_Date)
                self.setLineChart(name: DataTemp.ValueLight_Date, values: DataTemp.ValueLight)
            case .failure(let error):
                print(error)
            }
        }
    }
    //Date choose
    func endDuration(){
        EndDataPicker = UIDatePicker()
        EndDataPicker?.datePickerMode = .date
        EndDataPicker?.addTarget(self, action: #selector(dataEndChange(dataPicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognture:)))
        view.addGestureRecognizer(tapGesture)
        endTimeData.inputView = EndDataPicker
    }
    func startDuration(){
        StartDatePicker = UIDatePicker()
        StartDatePicker?.datePickerMode = .date
        StartDatePicker?.addTarget(self, action: #selector(dataStartChange(dataPicker:)), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognture:)))
        view.addGestureRecognizer(tapGesture)
        startTimeData.inputView = StartDatePicker
    }
    @objc func viewTapped(gestureRecognture: UITapGestureRecognizer){
        view.endEditing(true)

    }
    @objc func dataStartChange(dataPicker : UIDatePicker){
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd"
        startTimeData.text = dataFormatter.string(from: dataPicker.date)
        let startDuration : String = startTimeData.text!
        DataTemp.startDurationData = startDuration
        print(DataTemp.startDurationData)
        view.endEditing(true)
    }
    @objc func dataEndChange(dataPicker : UIDatePicker){
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd"
        endTimeData.text = dataFormatter.string(from: dataPicker.date)
        let endDuration : String = endTimeData.text!
        DataTemp.endDurationData = endDuration
        print(DataTemp.endDurationData)
        view.endEditing(true)
    }
    //Time choose


    //Line Chart
    func setLineChart(name : [String], values : [Double]){
        var lineChartArray : [ChartDataEntry] = []
        for i in 0..<name.count{
            let data : ChartDataEntry = ChartDataEntry(x : Double(i), y : values[i])
            lineChartArray.append(data)
        }
        let lineDataSet : LineChartDataSet = LineChartDataSet(values: lineChartArray, label: "Value")
        lineDataSet.setColor(#colorLiteral(red: 1, green: 0.326507926, blue: 0.2777207494, alpha: 1))
        
        let lineData : LineChartData = LineChartData(dataSet: lineDataSet)
        lineChartView.data = lineData
        lineChartView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func customeBox(){
        startTimeData.layer.borderWidth = 1
        startTimeData.layer.borderColor = UIColor.black.cgColor
        startTimeData.layer.cornerRadius = 15
        startTimeData.clipsToBounds = true
        
        endTimeData.layer.borderWidth = 1
        endTimeData.layer.borderColor = UIColor.black.cgColor
        endTimeData.layer.cornerRadius = 15
        endTimeData.clipsToBounds = true
        
        getData.layer.borderWidth = 1
        getData.layer.borderColor = UIColor.black.cgColor
        getData.layer.cornerRadius = 15
        getData.clipsToBounds = true
        

    }
}

