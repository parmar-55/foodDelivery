//
//  TableViewCell.swift
//  Desgin
//
//  Created by Demo 01 on 17/04/23.
//  Copyright © 2023 scs. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var img: UIImageView!

    @IBOutlet weak var lbl2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
