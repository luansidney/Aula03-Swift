//
//  TarefaUITableViewController.swift
//  ControleTarefa
//
//  Created by DeviOS on 29/12/14.
//  Copyright (c) 2014 DeviOS. All rights reserved.
//

import UIKit

var listaTarefa0 = ["Ligar PC"]
var listaTarefa1 = ["Atender Telefone"]
var listaTarefa2 = ["Criar Planilha"]

class TarefaUITableViewController: UITableViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
           return listaTarefa0.count
        case 1:
           return listaTarefa1.count
        default:
           return listaTarefa2.count
        }
        
    }
    
    
    //Contruindo a tabela com os dados do array
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("identificadorTabela", forIndexPath: indexPath) as UITableViewCell
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = listaTarefa0[indexPath.row]
        case 1:
            cell.textLabel?.text = listaTarefa1[indexPath.row]
        case 2:
            cell.textLabel?.text = listaTarefa2[indexPath.row]

        default:
            println("Oxe")
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       var nomeSection = ""
        switch section {
        case 0:
            nomeSection = "Alta"
        case 1:
            nomeSection = "Média"
        default:
            nomeSection = "Baixa"
        }
        return nomeSection
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if segue.identifier == "detalheTarefa" {
          //Antes de enviar para o proximo view
          let detalhe = segue.destinationViewController as DetalheTarefaViewController
          let indexPath = self.tableView.indexPathForSelectedRow()
            switch indexPath!.section {
            case 0:
                detalhe.detalheTarefa = listaTarefa0[indexPath!.row]
                detalhe.prioridade = "Alta"
            case 1:
                detalhe.detalheTarefa = listaTarefa1[indexPath!.row]
                detalhe.prioridade = "Média"
            default:
                detalhe.detalheTarefa = listaTarefa2[indexPath!.row]
                detalhe.prioridade = "Baixa"
            }
        }
    }

    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {            
           
            switch indexPath.section {
            case 0:
               listaTarefa0.removeAtIndex(indexPath.row)
            case 1:
                listaTarefa1.removeAtIndex(indexPath.row)
            default:
               listaTarefa2.removeAtIndex(indexPath.row)
            }          
            
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    
    
    
    
   /* // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
