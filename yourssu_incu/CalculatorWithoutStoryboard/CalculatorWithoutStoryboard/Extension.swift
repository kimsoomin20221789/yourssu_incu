//
//  Extension.swift
//  CalculatorWithoutStoryboard
//
//  Created by 김수민 on 2023/07/22.
//

import UIKit

extension UIView {
    func addSubViews(_ views: UIView ...){
        views.forEach {self.addSubview($0)}
    }
}
