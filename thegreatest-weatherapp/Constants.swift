//
//  Constants.swift
//  thegreatest-weatherapp
//
//  Created by David Clare on 4/2/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import Foundation


let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q="
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?id="
let API_KEY = "&APPID=a824d6da276864cb0663df04a911dfb7"
let UNITS = "&units=imperial"



typealias DownloadComplete = () -> ()

