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
}


protocol MainViewOutput{
    var resultTextLabel: String? {get set}
}

class MainViewModel: MainViewInput, MainViewOutput {
    let firstTextFieldInputSubject: PublishSubject<Int?> = PublishSubject()
    let secondTextFieldInputSubject: PublishSubject<Int?> = PublishSubject()
    var disposeBag: DisposeBag = DisposeBag()
    
    var resultTextLabel: String?
    var status: TextFieldStatus? {
        didSet {
            if let calculatorStatus = calculatorStatus,
               let status = status {
                switch status {
                case .didButton:
                    calculatorStatus("버튼을 눌러주세요")
                case .didSingleTextFieldFull:
                    calculatorStatus("숫자를 모두 입력해주세요.")
                case .twoEmpty:
                    calculatorStatus("값을 먼저 입력해주세요.")
                }
            }
        }
    }
    
    // MARK: - rx를 활용한 async
    var firstTextFieldNum: Int?
    var secondTextFieldNum: Int?
    var calculatorStatus: ((String) -> Void)?
    
    func firstTextFieldChange(num: RxSwift.Observable<String>) {
        num.map { $0.isEmpty ? nil : Int($0) } //behaviorSubject를 쓰는게 나을지..?
            .bind(to: firstTextFieldInputSubject)
            .disposed(by: disposeBag)
        num.subscribe(onNext: { [weak self] stringValue in
                self?.firstTextFieldNum = Int(stringValue)
            })
            .disposed(by: disposeBag)
    }
    
    func secondTextFieldChange(num: RxSwift.Observable<String>) {
        num.map{ $0.isEmpty ? nil : Int($0) } //behaviorSubject를 쓰는게 나을지..?
            .bind(to: secondTextFieldInputSubject)
            .disposed(by: disposeBag)
        num.subscribe(onNext: { [weak self] stringValue in
                self?.secondTextFieldNum = Int(stringValue)
            })
            .disposed(by: disposeBag)
    }
    

    func changeTextLabel() -> Void {
        return Observable.combineLatest(firstTextFieldInputSubject, secondTextFieldInputSubject)
            .map { num1, num2 in
                self.checkingValueValid(num1: num1, num2: num2)
            }.subscribe(onNext: {b in self.status = b})
            .disposed(by: disposeBag)
    }
    
}

extension MainViewModel {
    
    func checkingValueValid(num1: Int?, num2: Int?) -> TextFieldStatus {
        if num1 == nil && num2 == nil {
            return .twoEmpty
        } else if num1 == nil || num2 == nil {
            return .didSingleTextFieldFull
        } else {
            return .didButton
        }
    }
}

extension MainViewModel{
    
    // MARK: - about Click Button
    func statusChecking(type: CalculateType){
        switch status {
        case .didButton:
            if let calculatorStatus = calculatorStatus {
                calculatorStatus(makeSuccessString(value1: firstTextFieldNum, value2: secondTextFieldNum, calculatorType: type))
            }
        case .twoEmpty:
            if let calculatorStatus = calculatorStatus {
                calculatorStatus("값을 먼저 입력해주세요")
            }
        case .didSingleTextFieldFull:
            if let calculatorStatus = calculatorStatus {
                calculatorStatus("숫자를 모두 입력헤주세요")
            }
        case .none:
            if let calculatorStatus = calculatorStatus {
                calculatorStatus("값을 먼저 입력해주세요")
            }
        }
        
    }
    func makeSuccessString(value1: Int?, value2: Int?, calculatorType: CalculateType) -> String {
        switch calculatorType {
        case .add:
            if let value1 = value1, let value2 = value2 {
                return "\(value1) + \(value2) = \(value1 + value2)"
            } else {return "값을 먼저 입력해주세요."}
               
        case .subtract:
            if let value1 = value1, let value2 = value2 {
                return "\(value1) - \(value2) = \(value1 - value2)"
            } else {return "값을 먼저 입력해주세요."}
               
        case .multiply:
            if let value1 = value1, let value2 = value2 {
                return "\(value1) x \(value2) = \(value1 * value2)"
            } else {return "값을 먼저 입력해주세요."}
               
            
        case .divide:
            if let value1 = value1, let value2 = value2 {
                if value1 == 0 {
                    return "0으로 나눌 수 없습니다."
                } else {
                    return "\(value1) / \(value2) = \(value1 / value2)"
                }
            } else {return "값을 먼저 입력해주세요."}
        }
        
    }
}
