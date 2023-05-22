//
//  MemoTableViewCell.swift
//  Memo
//
//  Created by 김수민 on 2023/05/22.
//

import UIKit

class MemoTableViewCell: UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
