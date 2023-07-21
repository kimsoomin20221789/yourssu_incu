//
//  ValueTextField.swift
//  CalculatorWithoutStoryboard
//
//  Created by 김수민 on 2023/07/22.
//

import UIKit

class ValueTextField: UITextField {

    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        self.design()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textField = UITextField()
    var name: String
    
    func design(){
        self.placeholder = name
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        self.leftView = padding
        self.leftViewMode = .always
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 20
        self.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    }

}
