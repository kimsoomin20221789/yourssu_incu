//
//  MemoWriteViewController.swift
//  Memo
//
//  Created by 김수민 on 2023/05/22.
//

import UIKit

class MemoWriteViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
 
    let placeholderText = "Enter your text here"
    @IBAction func touchUpSetButton(_ sender: UIButton){
        UserInformation.shared.memoTitle.append(titleTextField.text ?? "")
        UserInformation.shared.memoContent.append(contentTextView.text ?? "")
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.layer.cornerRadius = 20
        contentTextView.delegate = self
        contentTextView.text = placeholderText
        contentTextView.textColor = .placeholderText
    
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == placeholderText {
                textView.text = ""
                textView.textColor = UIColor.black
            }
        }
    

}
