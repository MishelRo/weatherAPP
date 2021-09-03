//
//  DetailViewController.swift
//  weatherAPP
//
//  Created by User on 02.09.2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    var imagesView: UIImageView!
    var tempLabel: UILabel!
    var pressureLabel: UILabel!
    var cityLabel: UILabel!
    
    var feelsLike: UILabel!
    var tempMax: UILabel!
    var tempMin: UILabel!
    
    
    var model: DetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        imagesView = UIImageView()
        tempLabel = UILabel()
        pressureLabel = UILabel()
        cityLabel = UILabel()
        feelsLike = UILabel()
        tempMax = UILabel()
        tempMin = UILabel()
        model = DetailViewModel()
        configure()
        updateViews()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add To Favorite",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(rightBarButtonItem))
    }
    
    @objc func rightBarButtonItem() {
        model.saveCity(city: DetailViewModel.data.first?.name ?? "")
    }
    

    
    func updateViews() {
        tempLabel.font = .boldSystemFont(ofSize: 29)
        tempLabel.text =  "City- \(DetailViewModel.data.first?.name ?? "")"
        pressureLabel.text = "Pressure- \(model.tempConvertor(temp: Double((DetailViewModel.data.first?.main.pressure)!) ))"
        cityLabel.text = "Temp - \(model.tempConvertor(temp: DetailViewModel.data.first?.main.temp ?? 0))Cº"
        feelsLike.text = "FeelsLike- \(model.tempConvertor(temp: Double((DetailViewModel.data.first?.main.feelsLike)!) )) Cº"
        tempMax.text = "TempMax- \(model.tempConvertor(temp: Double((DetailViewModel.data.first?.main.tempMax)!) )) Cº"
        tempMin.text = "TempMin- \(model.tempConvertor(temp: Double((DetailViewModel.data.first?.main.tempMin)!) )) Cº"
        let image = WeatherImage().searchImageFromId(id: DetailViewModel.data.first?.weather.first?.id ?? 0)
        imagesView.image = image
        }
    
    func configure(){
        view.addSubview(imagesView)
        imagesView?.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        imagesView?.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        imagesView.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: view.topAnchor, multiplier: 2).isActive = true
        imagesView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        imagesView.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        imagesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        imagesView.contentMode = .redraw
        imagesView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tempLabel)
        tempLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tempLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tempLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tempLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        tempLabel.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 20).isActive = true
        tempLabel.textAlignment = .center
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pressureLabel)
        pressureLabel.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        pressureLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pressureLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pressureLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        pressureLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 20).isActive = true
        pressureLabel.textAlignment = .center
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(cityLabel)
        cityLabel.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        cityLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        cityLabel.topAnchor.constraint(equalTo: pressureLabel.bottomAnchor, constant: 20).isActive = true
        cityLabel.textAlignment = .center
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(feelsLike)
        feelsLike.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        feelsLike.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        feelsLike.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        feelsLike.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        feelsLike.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20).isActive = true
        feelsLike.textAlignment = .center
        feelsLike.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(tempMax)
        tempMax.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tempMax.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tempMax.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tempMax.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        tempMax.topAnchor.constraint(equalTo: feelsLike.bottomAnchor, constant: 20).isActive = true
        tempMax.textAlignment = .center
        tempMax.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(tempMin)
        tempMin.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        tempMin.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tempMin.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tempMin.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        tempMin.topAnchor.constraint(equalTo: tempMax.bottomAnchor, constant: 20).isActive = true
        tempMin.textAlignment = .center
        tempMin.translatesAutoresizingMaskIntoConstraints = false
    }
}
