//
//  ViewController.swift
//  Aula03
//
//  Created by DeviOS on 15/12/14.
//  Copyright (c) 2014 DeviOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResultado: UILabel!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtSaudacao: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func ClickBotao(sender: UIButton) {
        
        lblResultado.text = txtSaudacao.text + " " +  txtNome.text
        lblResultado.hidden = false
        txtSaudacao.resignFirstResponder()
        
    }

}

