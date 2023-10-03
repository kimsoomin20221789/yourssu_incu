//
//  View.swift
//  CalculatorWithMVVM
//
//  Created by 김수민 on 2023/07/25.
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
        view.addSubViews(value1TextField, value2TextField, result, addButton, subButton, mulButton, divButton)
        return view
    }()
    
    
    let value1TextField: ValueTextField = ValueTextField(name: "첫번째 입력값을 입력하세요.")
    let value2TextField: ValueTextField = ValueTextField(name: "두번째 입력값을 입력하세요.")

    let result: UILabel = {
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
        value1TextField.snp.makeConstraints{(make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalToSuperview().inset(157)
        }
        value2TextField.snp.makeConstraints{(make) in
            make.leading.trailing.equalToSuperview().inset(47)
            make.height.equalTo(39)
            make.top.equalTo(value1TextField.snp.bottom).offset(10)
        }
        result.snp.makeConstraints{(make) in
            make.top.equalTo(value2TextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        result.sizeToFit()
        
    }
}



