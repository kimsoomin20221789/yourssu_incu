//
//  ViewController.swift
//  Memo
//
//  Created by 김수민 on 2023/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var initLabel: UILabel!
    
    
    @IBOutlet weak var memoTableView: UITableView!
    let memoCellIdentifier: String = "memo"
    var memoTitle: [String] = []
    var memoContent: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        memoTitle = UserInformation.shared.memoTitle
        memoContent = UserInformation.shared.memoContent

        if memoTitle.count == 0 {
            // UILabel 생성 및 설정
             initLabel = UILabel()
             initLabel.numberOfLines = 0
             let text = "메모가 없습니다. \n 메모를 추가해주세요!"
             initLabel.text = text
             initLabel.textColor = UIColor.lightGray
             initLabel.textAlignment = .center
             initLabel.translatesAutoresizingMaskIntoConstraints = false
             // 뷰에 UILabel 추가
             view.addSubview(initLabel)
             // UILabel의 오토레이아웃
             initLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
             initLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        } else {
            initLabel.isHidden = true
            memoTableView.delegate = self
            memoTableView.dataSource = self
            self.memoTableView.reloadData()
        }
     }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.memoTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell 생성
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.memoCellIdentifier, for: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.memoTitle[indexPath.row]
        cell.detailTextLabel?.text = self.memoContent[indexPath.row]
        return cell
    }
    
}
