//
//  ViewModel.swift
//  CalculatorWithMVVM
//
//  Created by 김수민 on 2023/07/25.
//

import UIKit
import RxCocoa
import RxSwift
protocol MainViewInput{
    func firstTextFieldChange(num: Observable<String>)
    func secondTextFieldChange(num: Observable<String>)
    func addButtonAction()
    func subtractButtonAction()
    func multiplyButtonAction()
    func divideButtonAction()
}



protocol MainViewOutput{
    var resultTextLabel: String? {get set} //get set 왜?
}


class MainViewModel: MainViewInput, MainViewOutput {
    
    var resultTextLabel: String?
    var status: TextFieldStatus?
    
    func firstTextFieldChange(num: RxSwift.Observable<String>) {
        
    }
    
    func secondTextFieldChange(num: RxSwift.Observable<String>) {
        
    }
    
    func addButtonAction() {
        
    }
    
    func subtractButtonAction() {
        
    }
    
    func multiplyButtonAction() {
        
    }
    
    func divideButtonAction() {
        
    }
}
