//
//  LinhaCelulaTableViewCell.swift
//  ControleTarefaManual
//
//  Created by DeviOS on 05/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class LinhaCelulaTableViewCell: UITableViewCell {

    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblDescricao.sizeToFit()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
