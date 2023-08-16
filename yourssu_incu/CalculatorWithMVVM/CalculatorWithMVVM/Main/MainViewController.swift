//
//  ViewController.swift
//  CalculatorWithMVVM
//
//  Created by 김수민 on 2023/07/21.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    let mainView: View = View()
    var mainViewModel: MainViewModel?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
    }
    
    init(viewModel: MainViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.bindUI()
        self.mainViewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindUI(){
        mainViewModel?.calculatorStatus = { [weak self] text in
            self?.mainView.result.text = text
        }
        setTextLabel()
        setButtonAction()
    }
}

extension MainViewController {
    func setTextLabel(){
        mainViewModel?.firstTextFieldChange(num: mainView.value1TextField.rx.text.orEmpty.asObservable())
        mainViewModel?.secondTextFieldChange(num: mainView.value2TextField.rx.text.orEmpty.asObservable())
        mainViewModel?.changeTextLabel()
    }
    
    func setButtonAction(){
        mainView.addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        mainView.subButton.addTarget(self, action: #selector(subtractButtonAction), for: .touchUpInside)
        mainView.mulButton.addTarget(self, action: #selector(multiplyButtonAction), for: .touchUpInside)
        mainView.divButton.addTarget(self, action: #selector(divideButtonAction), for: .touchUpInside)
    }
    
}

extension MainViewController {
    @objc func addButtonAction() {
        self.mainViewModel?.statusChecking(type: .add)
    }
    
    @objc func subtractButtonAction() {
        self.mainViewModel?.statusChecking(type: .subtract)
    }
    
    @objc func multiplyButtonAction() {
        self.mainViewModel?.statusChecking(type: .multiply)
    }
    
    @objc func divideButtonAction() {
        self.mainViewModel?.statusChecking(type: .divide)
    }
}
