//
//  ListaUsuarioTableViewController.swift
//  Instagram
//
//  Created by DeviOS on 19/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class ListaUsuarioTableViewController: UITableViewController {

    var todosUsuarios = [PFUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let query = PFUser.query()
        query.findObjectsInBackgroundWithBlock { (usuarios:[AnyObject]!, erro: NSError!) -> Void in
            
            for usu in usuarios{
                if PFUser.currentUser() != nil{
                    if usu.username != PFUser.currentUser().username{
                    self.todosUsuarios.append(usu as PFUser)
                    }
                }
               /*else{
                    //Se nao tiver logado, redireciona para login
                    let view = ViewController()
                    self.presentViewController(view, animated: true) { () -> Void in }
                }*/
            }
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.todosUsuarios.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celulaUsuario", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = self.todosUsuarios[indexPath.row].username

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let linhaSelecionada = tableView.cellForRowAtIndexPath(indexPath)!
        let timeline = PFObject(className: "Timeline")
        
        if linhaSelecionada.accessoryType == UITableViewCellAccessoryType.Checkmark{
            
            linhaSelecionada.accessoryType == UITableViewCellAccessoryType.None
            
            
            let query = PFQuery(className: "Timeline")
            query.whereKeyExists("usuarioDestino.username = " + (self.todosUsuarios[indexPath.row] as PFUser).username)
            
            query.findObjectsInBackgroundWithBlock { (usuarios:[AnyObject]!, erro: NSError!) -> Void in
                
                for usu in usuarios{
                    usu.deleteInBackgroundWithBlock({ (Bool, NSError) -> Void in
                        println("Excluiu")
                    })
                }
            }

            
            
        }else{
            linhaSelecionada.accessoryType = UITableViewCellAccessoryType.Checkmark
            
           
            timeline["usuarioOrigem"] = PFUser.currentUser() as PFUser
            timeline["usuarioDestino"] = self.todosUsuarios[indexPath.row] as PFUser
            println(self.todosUsuarios[indexPath.row])
            println(PFUser.currentUser() as PFUser)
            timeline.saveInBackgroundWithBlock({ (Bool, NSError) -> Void in
                println("foi")
            })
            
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
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
