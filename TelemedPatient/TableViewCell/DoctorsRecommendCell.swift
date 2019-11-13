//
//  DoctorsRecommendCell.swift
//  TelemedPatient
//
//  Created by dr.mac on 19/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class DoctorsRecommendCell: UITableViewCell {

    @IBOutlet weak var imgDoctor: UIImageViewX!
    
    
    @IBOutlet weak var lbeLangData: UILabel!
    
    @IBOutlet weak var lbeDoctorName: UILabel!
    
    
    @IBOutlet weak var lbeRating: UILabel!
    
    @IBOutlet weak var lbeLang: UILabel!
    
    @IBOutlet weak var lbeRatingTitle: UILabel!
    
    @IBOutlet weak var lbeDecs: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
