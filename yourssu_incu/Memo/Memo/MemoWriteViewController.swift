//
//  MemoWriteViewController.swift
//  Memo
//
//  Created by 김수민 on 2023/05/22.
//

import UIKit

class MemoWriteViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    //MARK: IBOutlet
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    //MARK: IBAction
    //touchUpSetButton()
    let placeholderText = "내용을 작성해주세요."
    var textViewExist: Bool?
    
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.memoTitle.append(titleTextField.text ?? "")
        UserInformation.shared.memoContent.append(contentTextView.text ?? "")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    //MARK: registor Button 활성화
    func textViewDidChange(_ textView: UITextView) {
        //        if (contentTextView.text.isEmpty == false) {
        //            textViewExist = true
        //        }
        if (checkNextView() == true){
            registerButton.isEnabled = true
        }
    }
    func checkNextView() -> Bool {
        if (titleTextField.text?.isEmpty == false && contentTextView.text?.count != 0        ){
            return true
        }
        return false
    }
    @IBAction func allValueChange(_ sender: UITextField){
        if (checkNextView() == true){
            registerButton.isEnabled = true
        }
    }
    
    
    
    //MARK: View
    //viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerButton.isEnabled = false
        contentTextView.layer.cornerRadius = 20
        titleTextField.delegate = self
        contentTextView.delegate = self
        contentTextView.text = placeholderText
        contentTextView.textColor = .placeholderText
        textViewExist = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.titleTextField.text = nil
        //        self.contentTextView.text = nil
    }
    
    //MARK: Delegate
    //testViewDelegate method
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == placeholderText {
//            textView.text = ""
//            textView.textColor = UIColor.black
//        }
//    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        <#code#>
    }
}
