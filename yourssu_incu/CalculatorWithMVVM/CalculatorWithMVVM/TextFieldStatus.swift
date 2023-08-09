//
//  TextFieldStatus.swift
//  CalculatorWithMVVM
//
//  Created by 김수민 on 2023/08/09.
//

import Foundation
@frozen
enum TextFieldStatus {
//    case success(firstNum: Int, secondNum: Int, type: CalculateTpye, result: Int)
    case success
    case didSingleTextFieldFull
    case didAllTextFieldEmpty
    case zeroNumFail
}

