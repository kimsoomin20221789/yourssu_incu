//
//  ViewController.swift
//  CalculatorWithoutStoryboard
//
//  Created by 김수민 on 2023/06/23.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    let mainView: View = View()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAction()
    }
    
    func setAction(){
        mainView.addButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        mainView.subButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        mainView.mulButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        mainView.divButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        mainView.value1.addTarget(self, action: #selector(liveChecking), for: .editingChanged)
        mainView.value2.addTarget(self, action: #selector(liveChecking), for: .editingChanged)
    }
    
    @objc func calculate(_ sender: UIButton) {
        if let calculateButton = sender as? CalculateButton {
            let calculateName = calculateButton.name
            if calculateName == "더하기" {
                add()
            } else if calculateName == "빼기" {
                sub()
            } else if calculateName == "곱하기" {
                mul()
            } else if calculateName == "나누기" {
                div()
            }
        }
    }
    
    @objc func liveChecking(_ sender: UITextField){
        mainView.result.text = "버튼을 눌러주세요!"
        mainView.result.textColor = .black
        checking()
    }
    
    
    func add() {
        if let num1 = mainView.value1.text, let num2 = mainView.value2.text {
            if let a = Int(num1), let b = Int(num2) {
                let sum = a + b
                mainView.result.text = "\(a) + \(b) = \(sum)"
                mainView.result.textColor = .black
            } else {
                mainView.result.text = "숫자만 입력해주세요."
            }
        }
        checking()
    
    }
    
    func sub(){
        if let num1 = mainView.value1.text, let num2 = mainView.value2.text {
            if let a = Int(num1), let b = Int(num2) {
                let sum = a - b
                mainView.result.text = "\(a) - \(b) = \(sum)"
                mainView.result.textColor = .black
            } else {
                mainView.result.text = "숫자만 입력해주세요."
            }
        }
        checking()
    }
    func mul(){
        if let num1 = mainView.value1.text, let num2 = mainView.value2.text {
            if let a = Int(num1), let b = Int(num2) {
                let sum = a * b
                mainView.result.text = "\(a) x \(b) = \(sum)"
                mainView.result.textColor = .black
            } else {
                mainView.result.text = "숫자만 입력해주세요."
            }
        }
        checking()
    }
    func div(){
        if let num1 = mainView.value1.text, let num2 = mainView.value2.text {
            if let a = Int(num1), let b = Int(num2) {
                if a == 0 {
                    mainView.result.text = "0으로 나눌수 없습니다."
                    mainView.result.textColor = .gray
                } else {
                    let sum = a / b
                    mainView.result.text = "\(a) / \(b) = \(sum)"
                    mainView.result.textColor = .black
                }
            } else {
                mainView.result.text = "숫자만 입력해주세요."
            }
        }
        checking()
        
    }

    
    func checking(){
        if (mainView.value1.text == "" && mainView.value2.text == ""){ //nil로 하면 안되는 이유??
            mainView.result.text = "값을 먼저 입력해주세요."
            mainView.result.textColor = .gray
        } else if (mainView.value1.text == "" || mainView.value2.text == ""){
            mainView.result.text = "숫자를 모두 입력해주세요."
            mainView.result.textColor = .gray
        }
    }
    
}
