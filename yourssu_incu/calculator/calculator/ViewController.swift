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
    @IBOutlet var subtractButton: UIButton!
    @IBOutlet var multiplyButton: UIButton!
    @IBOutlet var divideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func operation(operatorString: String) -> String {
        var resultText: String
        if (firstField.text?.isEmpty == true && secondField.text?.isEmpty == true){
            resultText = "값을 먼저 입력해주세요."
        } else if (firstField.text?.isEmpty == true || secondField.text?.isEmpty == true){
            resultText = "숫자를 모두 입력해주세요."
        } else if let firstNumber = Int(firstField.text ?? ""),
                  let secondNumber = Int(secondField.text ?? ""){
            switch operatorString{
            case "+":
                let result = firstNumber + secondNumber
                resultText = "\(firstNumber) + \(secondNumber) = \(result)"
            case "-":
                let result = firstNumber - secondNumber
                resultText = "\(firstNumber) - \(secondNumber) = \(result)"
            case "x":
                let result = firstNumber * secondNumber
                resultText = "\(firstNumber) x \(secondNumber) = \(result)"
            case "/":
                if (secondNumber == 0){
                    resultText = "0으로 나눌 수 없습니다."
                    break
                }
                let result = firstNumber / secondNumber
                resultText = "\(firstNumber) / \(secondNumber) = \(result)"
            default :
                resultText = "0"
            }
        } else {
            resultText = "Please enter valid numbers in both text fields."
        }
        return resultText
    }
    
    
    
    // MARK: IBActions
    // MARK: add
    @IBAction func add(sender: UIButton){
        let resultText = operation(operatorString: "+")
        resultLabel.text = resultText
    }
    
    // MARK: subtract
    @IBAction func subtract(sender: UIButton){
        let resultText = operation(operatorString: "-")
        resultLabel.text = resultText
    }
    
    // MARK: multiply
    @IBAction func multiply(sender: UIButton){
        let resultText = operation(operatorString: "x")
        resultLabel.text = resultText
    }
    
    // MARK: division
    @IBAction func divide(sender: UIButton){
        let resultText = operation(operatorString: "/")
        resultLabel.text = resultText
    }
}

