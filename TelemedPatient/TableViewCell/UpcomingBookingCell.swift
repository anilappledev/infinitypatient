//
//  UpcomingBookingCell.swift
//  TelemedPatient
//
//  Created by dr.mac on 18/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class UpcomingBookingCell: UITableViewCell {
    
    @IBOutlet weak var imgDoctor: UIImageViewX!
    
    @IBOutlet weak var lbeDoctorName: UILabel!
    
    @IBOutlet weak var lbeDec: UILabel!
    
    
    @IBOutlet weak var lbeTime: UILabel!
    
    @IBOutlet weak var lbeWeekday: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
