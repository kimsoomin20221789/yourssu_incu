//
//  MemoDetailViewController.swift
//  Memo
//
//  Created by 김수민 on 2023/05/22.
//

import UIKit

class MemoDetailViewController: UIViewController {
    //MARK: Property
    var titleToSet: String?
    var contentToSet: String?
    
    //MARK: IBOutlet
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    //MARK: View
    //viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.titleLabel.text = titleToSet
        self.contentLabel.text = contentToSet
        self.contentLabel.numberOfLines = 0
    }
    
    //viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


}
