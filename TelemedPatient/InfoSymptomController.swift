//
//  InfoSymptomController.swift
//  TelemedPatient
//
//  Created by dr.mac on 20/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit

class InfoSymptomController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
        @IBAction func Cancel(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
        }
    }

    //MARK: - TableViewDataSource Delegate
    extension InfoSymptomController : UITableViewDataSource
    {
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 4
        }
        
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cellOfProfile = tableView.dequeueReusableCell(withIdentifier: "InfoSymptomCell", for: indexPath) as? InfoSymptomCell else {
                    return InfoSymptomCell()
                }
                cellOfProfile.selectionStyle = .none
                return UITableViewCell()
        }
   }

    //MARK: - TableViewDelegate Delegate
    extension InfoSymptomController : UITableViewDelegate
    {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
            return 44
        }
   }

