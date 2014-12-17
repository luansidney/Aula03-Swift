//
//  ViewController.swift
//  Aula04
//
//  Created by DeviOS on 17/12/14.
//  Copyright (c) 2014 DeviOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnChamarViaCodigo(sender: UIButton) {
        
        let con:meuViewController =  meuViewController()
        self.navigationController?.pushViewController(con, animated: true)
    
    }

}

