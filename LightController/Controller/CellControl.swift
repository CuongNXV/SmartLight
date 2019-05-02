//
//  CellControl.swift
//  LightController
//
//  Created by Cuong Nguyen on 4/10/19.
//  Copyright © 2019 Cuong Nguyen. All rights reserved.
//

import UIKit

class CellControl: UITableViewCell {

    @IBOutlet weak var NameDevice: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
