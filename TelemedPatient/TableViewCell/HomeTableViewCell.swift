//
//  HomeTableViewCell.swift
//  TelemedPatient
//
//  Created by dr.mac on 17/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lbeTitle: UILabel!
    
    @IBOutlet weak var img: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
