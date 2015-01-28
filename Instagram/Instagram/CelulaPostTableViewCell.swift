//
//  CelulaPostTableViewCell.swift
//  Instagram
//
//  Created by DeviOS on 26/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class CelulaPostTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var lblusuario: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
