//
//  PrescriptionsCell.swift
//  TelemedPatient
//
//  Created by dr.mac on 15/10/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class PrescriptionsCell: UITableViewCell {

    @IBOutlet weak var lbeLineB: UILabel!
    
    @IBOutlet weak var lbeLine1B: UILabel!
    
    @IBOutlet weak var lbeLine2B: UILabel!
    
    @IBOutlet weak var lbedrug: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
