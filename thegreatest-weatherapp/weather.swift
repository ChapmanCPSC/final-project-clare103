//
//  weather.swift
//  thegreatest-weatherapp
//
//  Created by David Clare on 4/2/16.
//  Copyright © 2016 David Clare. All rights reserved.


import Foundation
import Alamofire

class Weather {
    private var _cityName: String!
    private var _countryName: String!
    private var _today: String!
    private var _time: String!
    private var _icon: String!
    private var _temperature: String!
    private var _pressure: Double!
    private var _humidity: String!
    private var _windSpeed: String!
    private var _weatherUrl: String!
    private var _dayOneName: String!
    private var _dayOneName2: String!
    private var _dayOneIcon: String!
    private var _dayOneMinTemp: String!
    private var _dayOneMaxTemp: String!
    private var _dayOneDesc: String!
    private var _dayTwoName: String!
    private var _dayTwoName2: String!
    private var _dayTwoIcon: String!
    private var _dayTwoMinTemp: String!
    private var _dayTwoMaxTemp: String!
    private var _dayTwoDesc: String!
    private var _dayThreeName: String!
    private var _dayThreeName2: String!
    private var _dayThreeIcon: String!
    private var _dayThreeMinTemp: String!
    private var _dayThreeMaxTemp: String!
    private var _dayThreeDesc: String!
    
    var countryName: String{
        if _countryName == nil{
            _countryName = ""
        }
        return _countryName
    }

    var today: String {
        if _today == nil {
            _today = ""
        }
        return _today
    }
    
    var time: String{
        if _time == nil{
            _time = ""
        }
        return _time
    }
    
    var dayOneName: String{
        if _dayOneName == nil{
            _dayOneName = ""
        }
        return _dayOneName
    }
    
    var dayOneName2: String{
        if _dayOneName2 == nil{
            _dayOneName2 = ""
        }
        return _dayOneName2
    }

    
    var dayOneIcon: String {
        if _dayOneIcon == nil {
            _dayOneIcon = ""
        }
        return _dayOneIcon
    }
    
    var dayOneMinTemp: String {
        if _dayOneMinTemp == nil {
            _dayOneMinTemp = ""
        }
        return _dayOneMinTemp
    }
    
    var dayOneMaxTemp: String {
        if _dayOneMaxTemp == nil {
            _dayOneMaxTemp = ""
        }
        return _dayOneMaxTemp
    }
    
    
    var dayOneDesc: String {
        if _dayOneDesc == nil {
            _dayOneDesc = ""
        }
        return _dayOneDesc
    }
    
    var dayTwoName: String {
        if _dayTwoName == nil {
            _dayTwoName = ""
        }
        return _dayTwoName
    }
    
    var dayTwoName2: String {
        if _dayTwoName2 == nil {
            _dayTwoName2 = ""
        }
        return _dayTwoName2
    }

    
    var dayTwoIcon: String {
        if _dayTwoIcon == nil {
            _dayTwoIcon = ""
        }
        return _dayTwoIcon
    }
    
    var dayTwoMinTemp: String {
        if _dayTwoMinTemp == nil {
            _dayTwoMinTemp = ""
        }
        return _dayTwoMinTemp
    }
    
    var dayTwoMaxTemp: String {
        if _dayTwoMaxTemp == nil {
            _dayTwoMaxTemp = ""
        }
        return _dayTwoMaxTemp
    }
    
    var dayTwoDesc: String {
        if _dayTwoDesc == nil {
            _dayTwoDesc = ""
        }
        return _dayTwoDesc
    }
    
    var dayThreeName: String {
        if _dayThreeName == nil {
            _dayThreeName = ""
        }
        return _dayThreeName
    }
    
    var dayThreeName2: String {
        if _dayThreeName2 == nil {
            _dayThreeName2 = ""
        }
        return _dayThreeName2
    }
    
    var dayThreeIcon: String {
        if _dayThreeIcon == nil {
            _dayThreeIcon = ""
        }
        return _dayThreeIcon
    }
    
    var dayThreeMinTemp: String {
        if _dayThreeMinTemp == nil {
            _dayThreeMinTemp = ""
        }
        return _dayThreeMinTemp
    }
    
    var dayThreeMaxTemp: String {
        if _dayThreeMaxTemp == nil {
            _dayThreeMaxTemp = ""
        }
        return _dayThreeMaxTemp
    }
    
    var dayThreeDesc: String {
        if _dayThreeDesc == nil {
            _dayThreeDesc = ""
        }
        return _dayThreeDesc
    }
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
/*
    var cityID: Int {
        return _cityID
    }
    

    var weatherDesc: String {
        if _weatherDesc == nil {
            _weatherDesc = ""
        }
        return _weatherDesc
    }
 */
    var icon: String {
        get {
            if _icon == nil {
                _icon = ""
            }
            return _icon
            
        }
    }
    
    var temperature: String {
        if _temperature == nil {
            _temperature = ""
        }
        return _temperature
    }
    
    var humidity: String {
        if _humidity == nil {
            _humidity = ""
        }
        return _humidity
    }
    
    var windSpeed: String {
        if _windSpeed == nil {
            _windSpeed = ""
        }
        return _windSpeed
    }
    
    var pressure: Double {
        if _pressure == nil{
            _pressure = 0
        }
        return _pressure * 0.0145038
    }
/*
    var sunrise: String {
        if _sunrise == nil {
            _sunrise = ""
        }
        return _sunrise
    }

    var sunset: String {
        if _sunset == nil {
            _sunset = ""
        }
        return _sunset
    }
  */
        
    init(cityName: String) {
        
        self._cityName = cityName
        _weatherUrl = "\(WEATHER_URL)\(self._cityName)\(UNITS)\(API_KEY)"
        
    }
    
    func getTime(date: NSTimeInterval) -> String {
        let date1 = NSDate(timeIntervalSince1970: date)
        let calendar = NSCalendar.currentCalendar()
        let hour = calendar.component(NSCalendarUnit.Hour, fromDate: date1)
        let minute = calendar.component(NSCalendarUnit.Minute, fromDate: date1)
        let time = "\(hour):\(minute)"
        return time
    }
    
    func formatDate(unixDate: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixDate)
        let weekDay = NSDateFormatter()
        weekDay.dateFormat = "EEE"
        let formattedDate = weekDay.stringFromDate(date)
        return formattedDate
    }
    
    func formatDate2(unixDate: Double) -> String {
        let date = NSDate(timeIntervalSince1970: unixDate)
        let weekDay = NSDateFormatter()
        weekDay.dateFormat = "EEEE, MMMM dd, yyyy"
        let formattedDate = weekDay.stringFromDate(date)
        return formattedDate
    }

    
    
    /*
    func convertPressure(press: Double) -> Double {
        let converted = press * 0.75006375541921
        return converted
    }
    */
    
    func downloadWeatherDetails(completed: DownloadComplete) {
        let url = NSURL(string: self._weatherUrl)!
        Alamofire.request(.GET, url).responseJSON { (response) -> Void in
            
            if let dict = response.result.value as? Dictionary<String,AnyObject> {
                
                if let city = dict["name"] as? String{
                    self._cityName = city
                }
                
                if let sys = dict["sys"] as? Dictionary<String, AnyObject>{
                    if let country = sys["country"] as? String{
                        self._countryName = country
                    }
                }
                
                if let weather = dict["weather"] as? [Dictionary<String,AnyObject>] {
                    if let icon = weather[0]["icon"] as? String {
                        self._icon = icon
                      //  print(self._icon)
                    }
                }
                if let time = dict["dt"] as? Double {
                    let date = NSDate(timeIntervalSince1970: time)
                    let weekDay = NSDateFormatter()
                    weekDay.dateFormat = "h:mm a"
                    let formattedDate = weekDay.stringFromDate(date)
                    self._time = formattedDate
                }
                if let time = dict["dt"] as? Double {
                    let date = NSDate(timeIntervalSince1970: time)
                    let weekDay = NSDateFormatter()
                    weekDay.dateFormat = "EEEE"
                    let formattedDate = weekDay.stringFromDate(date)
                    self._today = formattedDate
                }
                
                
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let temperature = main["temp"] as? Double {
                        self._temperature = NSString(format: "%.0f", temperature) as String
                    }
                    if let humidity = main["humidity"] as? Int {
                        self._humidity = "\(humidity)"
                    }
                    if let pressure = main["pressure"] as? Double{
                        self._pressure = pressure
                    }
                    
                }
                if let wind = dict["wind"] as? Dictionary<String,AnyObject> {
                    if let windSpeed = wind["speed"] as? Double {
                        self._windSpeed = "\(windSpeed)"
                    }
                }
               // print("got here")
                if let cityID = dict["id"] as? Int{
                    let _forecastUrl = "\(FORECAST_URL)\(cityID)\(UNITS)\(API_KEY)"
                    let nsurl = NSURL(string: _forecastUrl)
                Alamofire.request(.GET, nsurl!).responseJSON(completionHandler: { (response) -> Void in
                    if let forecast = response.result.value as?  Dictionary<String,AnyObject> {
                        if let list = forecast["list"] as? [Dictionary<String,AnyObject>] {
                            if let dayOneName = list[1]["dt"] as? Double {
                                self._dayOneName = self.formatDate(dayOneName)
                                self._dayOneName2 = self.formatDate2(dayOneName)
                            }
                            if let dayOneTemp = list[1]["temp"] as? Dictionary<String,AnyObject> where dayOneTemp.count > 0{
                                if let dayOneMinTemp = dayOneTemp["min"] as? Double {
                                    self._dayOneMinTemp = NSString(format: "%.0f", dayOneMinTemp) as String
                                }
                                if let dayOneMaxTemp = dayOneTemp["max"] as? Double {
                                    self._dayOneMaxTemp = NSString(format: "%.0f", dayOneMaxTemp) as String
                                }
                            }
                            if let dayOneCond = list[1]["weather"] as? [Dictionary<String,AnyObject>] where dayOneCond.count > 0 {
                                if let dayOneIcon = dayOneCond[0]["icon"] as? String {
                                    self._dayOneIcon = dayOneIcon
                                }
                                if let dayOneDesc = dayOneCond[0]["description"] as? String {
                                    self._dayOneDesc = dayOneDesc
                                }
                                
                            }
                            if let dayTwoName = list[2]["dt"] as? Double {
                                self._dayTwoName = self.formatDate(dayTwoName)
                                self._dayTwoName2 = self.formatDate2(dayTwoName)
                            }
                            if let dayTwoTemp = list[2]["temp"] as? Dictionary<String,AnyObject> where dayTwoTemp.count > 0 {
                                if let dayTwoMinTemp = dayTwoTemp["min"] as? Double {
                                    self._dayTwoMinTemp = NSString(format: "%.0f", dayTwoMinTemp) as String
                                }
                                if let dayTwoMaxTemp = dayTwoTemp["max"] as? Double {
                                    self._dayTwoMaxTemp = NSString(format: "%.0f", dayTwoMaxTemp) as String
                                }
                            }
                            if let dayTwoCond = list[2]["weather"] as? [Dictionary<String,AnyObject>] where dayTwoCond.count > 0 {
                                if let dayTwoIcon = dayTwoCond[0]["icon"] as? String {
                                    self._dayTwoIcon = dayTwoIcon
                                }
                                if let dayTwoDesc = dayTwoCond[0]["description"] as? String {
                                    self._dayTwoDesc = dayTwoDesc
                                }
                            }
                            if let dayThreeName = list[3]["dt"] as? Double {
                                self._dayThreeName = self.formatDate(dayThreeName)
                                self._dayThreeName2 = self.formatDate2(dayThreeName)
                            }
                            if let dayThreeTemp = list[3]["temp"] as? Dictionary<String,AnyObject> where dayThreeTemp.count > 0 {
                                if let dayThreeMinTemp = dayThreeTemp["min"] as? Double {
                                    self._dayThreeMinTemp = NSString(format: "%.0f", dayThreeMinTemp) as String
                                }
                                if let dayThreeMaxTemp = dayThreeTemp["max"] as? Double {
                                    self._dayThreeMaxTemp = NSString(format: "%.0f", dayThreeMaxTemp) as String
                                }
                            }
                            if let dayThreeCond = list[3]["weather"] as? [Dictionary<String,AnyObject>] where dayThreeCond.count > 0 {
                                if let dayThreeIcon = dayThreeCond[0]["icon"] as? String {
                                    self._dayThreeIcon = dayThreeIcon
                                }
                                if let dayThreeDesc = dayThreeCond[0]["description"] as? String {
                                    self._dayThreeDesc = dayThreeDesc
                                }

                            }
                          //  print("completed download")
                            completed()
                            
                        }
                    }
                    
                    
                })
                
            }
            
            
        }
    }
    }
}
