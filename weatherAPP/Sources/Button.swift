//
//  Button.swift
//  weatherAPP
//
//  Created by User on 03.09.2021.
//
import UIKit

class CustomButton: UIButton {

   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (background : UIColor, title: String ) {
        self.init (frame: .zero)
        self.backgroundColor = background
        setTitle(title, for: .normal)
    }
    
    
    
    
    func configure() {
        layer.cornerRadius = 10
        setTitle("Add New City", for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
