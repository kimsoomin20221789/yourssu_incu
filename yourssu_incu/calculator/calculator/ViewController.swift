//
//  ViewController.swift
//  calculator
//
//  Created by 김수민 on 2023/04/13.
//

import UIKit

class ViewController: UIViewController {
        
    // MARK: IBOutlets
    @IBOutlet var firstField: UITextField!
    @IBOutlet var secondField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var subButton: UIButton!
    @IBOutlet var mulButton: UIButton!
    @IBOutlet var divButton: UIButton!
    
    // MARK: ??
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: IBActions
    @IBAction func add(sender: UIButton){
        var resultText: String
        if var firstNumber = Int(firstField.text ?? ""), var secondNumber = Int(secondField.text ?? "") {
            var result = firstNumber + secondNumber
            resultText = "\(firstNumber) + \(secondNumber) = \(result)."
        } else {
            resultText = "Please enter valid numbers in both text fields."
        }
        resultLabel.text = resultText
    }
    
    @IBAction func sub(sender: UIButton){
        var resultText: String
        if var firstNumber = Int(firstField.text ?? ""), var secondNumber = Int(secondField.text ?? "") {
            var result = firstNumber - secondNumber
            resultText = " \(firstNumber) - \(secondNumber) = \(result)."
        } else {
            resultText = "Please enter valid numbers in both text fields."
        }
        resultLabel.text = resultText
    }
    
    @IBAction func mul(sender: UIButton){
        var resultText: String
        if var firstNumber = Int(firstField.text ?? ""), var secondNumber = Int(secondField.text ?? "") {
            var result = firstNumber * secondNumber
            resultText = " \(firstNumber) x \(secondNumber) = \(result)."
        } else {
            resultText = "Please enter valid numbers in both text fields."
        }
        resultLabel.text = resultText
    }
    
    //switch 문으로??
    @IBAction func div(sender: UIButton){
        var resultText: String
        if (firstField.text?.isEmpty == true && secondField.text?.isEmpty == true){
            resultText = "값을 먼저 입력해주세요."
        } else if (firstField.text?.isEmpty == true || secondField.text?.isEmpty == true){
            resultText = "숫자를 모두 입력해주세요."
        } else if var firstNumber = Int(firstField.text ?? ""), var secondNumber = Int(secondField.text ?? "") {
                var result = firstNumber / secondNumber
                resultText = "\(firstNumber) / \(secondNumber) = \(result)."
                //나누기에서 0 예외처리하기
                if (firstNumber == 0){
                    resultText = "0은 나눌 수 없습니다."
                }
        } else {
            resultText = "Please enter valid numbers in both text fields."
        }
        resultLabel.text = resultText
    }



}

