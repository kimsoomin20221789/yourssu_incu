//
//  View.swift
//  CalculatorWithoutStoryboard
//
//  Created by 김수민 on 2023/07/16.
//

import UIKit
import SnapKit

class View: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(pushView)
        pushView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var pushView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addSubview(value1)
        view.addSubview(value2)
        view.addSubview(result)
        view.addSubview(addButton)
        view.addSubview(subButton)
        view.addSubview(mulButton)
        view.addSubview(divButton)
        return view
    }()
    
    
    let value1: UITextField = valueTextField(name: "첫번째 입력값을 입력하세요.")
    let value2: UITextField = valueTextField(name: "두번째 입력값을 입력하세요.")

    lazy var result: UILabel = {
        print(33)

        let label = UILabel()
        label.text = "값을 먼저 입력해주세요"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.textAlignment = .center
        label.layer.cornerRadius = 20
        return label
    }()
    let addButton: UIButton = CalculateButton(name: "더하기")
    let subButton: UIButton = CalculateButton(name: "빼기")
    let mulButton: UIButton = CalculateButton(name: "곱하기")
    let divButton: UIButton = CalculateButton(name: "나누기")
    
    func setConstraints(){
        addButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalToSuperview().offset(320)
        }
        subButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(addButton.snp.bottom).offset(10)
        }
        mulButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(subButton.snp.bottom).offset(10)
        }
        divButton.snp.makeConstraints{ (make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(mulButton.snp.bottom).offset(10)
        }
        value1.snp.makeConstraints{(make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
//            make.top.equalTo(157)
            make.top.equalToSuperview().inset(157)
        }
        value2.snp.makeConstraints{(make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(value1.snp.bottom).offset(10)
        }
        result.snp.makeConstraints{(make) in
            make.top.equalTo(value2.snp.bottom).offset(20)
//            make.width.equalTo(108)
//            make.height.equalTo(22)
            make.centerX.equalToSuperview()
        }
        result.sizeToFit()
        
    }
}
    
class valueTextField: UITextField {
//    override init(frame: CGRect){
////        super.init(frame: frame)
//        self.design()
//    }
    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        self.design()
    }
//
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
    }
}
    

