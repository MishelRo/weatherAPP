//
//  MainViewModel.swift
//  weatherAPP
//
//  Created by User on 02.09.2021.
//

import UIKit
import Bond
class MainViewModel{
    var coreData = CoreDataManager()
    var network = Network()
    var arrayOfCity = ["Saratov", "Bishkek", "Moscow", "Ufa", "Kiev", "California", "Washington", "Kazan"]
    var view = MainViewController()
    var arrayOfData = Observable <[ModelJSON]>([])
    var cityInformation =  [ModelJSON]()
    
    func tableOfCityData(array: [String]) {
        for item in array{
            print(arrayOfCity.count)
            network.getWheatherByCity(url: Constants.weatherApi, city: item) { [unowned self] (responce) in
                self.arrayOfData.value.append(responce)
                print(arrayOfData.value.count)
            }
        }
    }
    
    func getCity(complession: @escaping([String])->()) {
        var array = [String]()
        coreData.getSavedCity { (city) in
            array.append(city)
        }
        guard array.count > 0 else {return}
        complession(array)
    }
    
    func citySearch(city: String, complession: @escaping(ModelJSON)->()){
        network.getWheatherByCity(url: Constants.weatherApi, city: city) { [unowned self] (responce) in
            complession(responce)
        }
    }
    
}
