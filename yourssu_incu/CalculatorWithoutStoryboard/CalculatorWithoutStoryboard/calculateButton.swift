//
//  CalculateButton.swift
//  CalculatorWithoutStoryboard
//
//  Created by 김수민 on 2023/07/18.
//

import Foundation
import UIKit


class CalculateButton: UIButton {
    var name: String?
    
    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        self.design()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func design(){
        self.setTitle(name, for: .normal)
        self.backgroundColor = .systemTeal
        self.layer.cornerRadius = 20
        self.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 15)
    }
    
}
