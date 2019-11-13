//
//  MedicalCell.swift
//  TelemedPatient
//
//  Created by dr.mac on 18/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class MedicalCell: UITableViewCell {

    @IBOutlet weak var lbeLineB: UILabel!
    
    @IBOutlet weak var lbeLine1B: UILabel!
    
    @IBOutlet weak var lbeLine2B: UILabel!
    
    @IBOutlet weak var lbedrug: UILabel!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
