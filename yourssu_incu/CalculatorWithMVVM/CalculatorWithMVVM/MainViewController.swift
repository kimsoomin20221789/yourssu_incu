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
        setTextLabel()
        setButtonAction()
    }

    
}

extension MainViewController {
    func setTextLabel(){
        
    }
    
    func setButtonAction(){
        
    }
}
