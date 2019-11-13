//
//  TimeSlotCell.swift
//  TelemedPatient
//
//  Created by dr.mac on 24/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class TimeSlotCell: UITableViewCell {

    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var lbeTime: UIView!

    @IBOutlet weak var lbeTimeRage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
