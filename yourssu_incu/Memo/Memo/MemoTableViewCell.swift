//
//  MemoTableViewCell.swift
//  Memo
//
//  Created by 김수민 on 2023/05/22.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    //MARK: IBOutlet
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
