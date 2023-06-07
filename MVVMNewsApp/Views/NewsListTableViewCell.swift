//
//  NewsListTableViewCell.swift
//  MVVMNewsApp
//
//  Created by DA MAC M1 139 on 2023/06/02.
//

import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var descriptionTextLabel: UILabel!
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
