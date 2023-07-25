//
//  CalculatorButton.swift
//  CalculatorWithMVVM
//
//  Created by 김수민 on 2023/07/25.
//

import Foundation
import UIKit


class CalculateButton: UIButton { //struct가 안되는 이유??
    var name: String?
    
    func design(){
        self.setTitle(name, for: .normal)
        self.backgroundColor = .systemTeal
        self.layer.cornerRadius = 20
    }

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        self.design()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    } //이건 뭐하는애지??? 없으면 에러뜨던데 ㅜㅜㅜ
    
}
