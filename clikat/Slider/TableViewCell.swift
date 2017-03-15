//
//  TableViewCell.swift
//  clikat
//
//  Created by Sierra 4 on 10/03/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
@IBOutlet weak var iconimage: UIImageView!
@IBOutlet weak var labelname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
