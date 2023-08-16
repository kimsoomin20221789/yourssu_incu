//
//  Extension.swift
//  CalculatorWithMVVM
//
//  Created by 김수민 on 2023/07/25.
//
import UIKit

extension UIView {
    func addSubViews(_ views: UIView ...){
        views.forEach {self.addSubview($0)}
    }
}
