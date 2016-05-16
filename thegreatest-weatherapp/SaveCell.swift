//
//  SaveCell.swift
//  thegreatest-weatherapp
//
//  Created by Ross Clare on 5/15/16.
//  Copyright © 2016 David Clare. All rights reserved.
//

import UIKit

class SaveCell: UITableViewCell {
 
    @IBOutlet weak var cityLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(city: City){
        
        cityLbl.text = city.cityName

    }
    

}
