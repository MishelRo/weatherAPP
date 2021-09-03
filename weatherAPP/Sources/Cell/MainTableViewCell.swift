//
//  MainTableViewCell.swift
//  weatherAPP
//
//  Created by User on 02.09.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var imagesView: UIImageView!
    var tempLabel: UILabel!
    var pressureLabel: UILabel!
    var cityLabel: UILabel!
    
    static var cellName = "MainTableViewCell"
    static var reuseId = "Cell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        imagesView = UIImageView()
        tempLabel = UILabel()
        pressureLabel = UILabel()
        cityLabel = UILabel()
        cellConfigure()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func cellConfigure(){
        
        addSubview(imagesView)
        imagesView?.rightAnchor.constraint(equalTo:safeAreaLayoutGuide.rightAnchor).isActive = true
        imagesView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        imagesView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        imagesView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        imagesView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tempLabel)
        tempLabel.leftAnchor.constraint(equalTo:safeAreaLayoutGuide.leftAnchor).isActive = true
        tempLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        tempLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        tempLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        tempLabel.textAlignment = .center
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(pressureLabel)
        pressureLabel.leftAnchor.constraint(equalTo:safeAreaLayoutGuide.leftAnchor).isActive = true
        pressureLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        pressureLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        pressureLabel.bottomAnchor.constraint(equalTo: tempLabel.topAnchor, constant: -10).isActive = true
        pressureLabel.textAlignment = .center
        pressureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(cityLabel)
        cityLabel.font = .boldSystemFont(ofSize: 21)
        cityLabel.leftAnchor.constraint(equalTo:safeAreaLayoutGuide.leftAnchor).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
        cityLabel.bottomAnchor.constraint(equalTo: pressureLabel.topAnchor, constant: -10).isActive = true
        cityLabel.textAlignment = .center
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
