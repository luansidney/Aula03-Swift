//
//  DetalheTarefaViewController.swift
//  ControleTarefa
//
//  Created by DeviOS on 29/12/14.
//  Copyright (c) 2014 DeviOS. All rights reserved.
//

import UIKit

class DetalheTarefaViewController: UIViewController {
    var detalheTarefa = ""
    
    @IBOutlet weak var lblDetalheTarefa: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDetalheTarefa.text = detalheTarefa
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
