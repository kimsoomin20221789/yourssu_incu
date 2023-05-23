//
//  ViewController.swift
//  Memo
//
//  Created by 김수민 on 2023/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var memoTableView: UITableView!
    var initLabel: UILabel! //UILabel은 코드로 구현
    let memoCellIdentifier: String = "memo"
    var memoTitle: [String] = []
    var memoContent: [String] = []

    // MARK: - view
    // viewDidload()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //viewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        memoTitle = UserInformation.shared.memoTitle
        memoContent = UserInformation.shared.memoContent
        
        //tableView 생성하지 않을때 UILabel 뷰에 올려주기
        if memoTitle.count == 0 {
            // UILabel 생성 및 설정
             initLabel = UILabel()
             initLabel.numberOfLines = 0 //UILabel 여러줄 입력 가능
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
    
   // MARK: tableViewDelegate, tableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.memoTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.memoCellIdentifier, for: indexPath) as! UITableViewCell
        cell.textLabel?.text = self.memoTitle[indexPath.row]
        cell.detailTextLabel?.text = self.memoContent[indexPath.row]
        cell.detailTextLabel?.textColor = .placeholderText
        return cell
    }
    
    // MARK: - prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: MemoDetailViewController = segue.destination as? MemoDetailViewController else {return}
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {return}
        
        nextViewController.titleToSet = cell.textLabel?.text
        nextViewController.contentToSet = cell.detailTextLabel?.text
        
    }
    
}
