//
//  Network.swift
//  weatherAPP
//
//  Created by User on 01.09.2021.
//
struct Weathers {
    var city: String
    var date: String
    var temp: String
}


import UIKit
import MapKit
import SwiftyJSON
import Alamofire

class Network{
    
    private var json = JSON()
    private var wheatherCondition: String = ""
    private var locationManager = CLLocationManager()
    private var cityName: String = ""
    private var date: String = ""
    private var temp: String = ""
    private var lat: CLLocationDegrees = 0
    private var lon: CLLocationDegrees = 0
    
    func setDataOnLabel(coordinates: (CLLocationDegrees, CLLocationDegrees), complessionWeather: @escaping(Weathers)->()){
        let url = URL(string: "https://api.weather.yandex.ru/v1/forecast?lat="+"\(coordinates.0)&lon="+"\(coordinates.1)&extra=false")
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        request.setValue("dd2beeb7-5237-4dba-b943-418cc88c24e2", forHTTPHeaderField: "X-Yandex-API-Key")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error took place \(error)")
                return
            }
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                self.wheatherCondition = dataString
                self.json = JSON(data)
                self.date = self.json["now_dt"].stringValue
                self.temp = self.json["fact"]["temp"].stringValue
            }
            let currentWeather = Weathers(city: self.cityName, date: self.date, temp: self.temp)
            complessionWeather(currentWeather)
        }
        task.resume()
        
    }
    
    
    func getWheatherByCity(url: String, city: String, complession: @escaping(ModelJSON)->()){
        guard  let url = URL(string: "\(url)\(city)\(Constants.apiKey)") else {return}
        AF.request(url, method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers: nil,
                   interceptor: nil,
                   requestModifier: nil).responseJSON { (responce) in
                    if responce.error == nil {
                        guard let data = responce.data else {return}
                        guard let modelJSON = try? JSONDecoder().decode(ModelJSON.self, from: data) else {return}
                        complession(modelJSON)
                    } else {
                        print(responce.error)
                    }
                   }
    }
}
