//
//  weatherData.swift
//  Clima
//
//  Created by PMJs on 24/3/2563 BE.
//  Copyright © 2563 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Decodable{
    let name : String
    let main : Main
    let weather : [Weather]
}

struct Main : Decodable {
    let temp : Double
}

struct Weather : Decodable {
    let id :Int
    let main : String
    let description : String
   
    let icon : String
}
