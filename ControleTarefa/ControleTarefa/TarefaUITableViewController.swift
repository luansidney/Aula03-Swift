//
//  TarefaUITableViewController.swift
//  ControleTarefa
//
//  Created by DeviOS on 29/12/14.
//  Copyright (c) 2014 DeviOS. All rights reserved.
//

import UIKit

var listTarefa = ["Responder Emails", "Homologar"]

class TarefaUITableViewController: UITableViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("", f)
    }
    


    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
