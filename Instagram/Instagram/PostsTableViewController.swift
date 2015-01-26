//
//  PostsTableViewController.swift
//  Instagram
//
//  Created by DeviOS on 26/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    var listaPosts = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl?.addTarget(self, action: "atualizarLista", forControlEvents: UIControlEvents.ValueChanged)
       
        self.atualizarLista()
        
        /*query.findObjectsInBackgroundWithBlock { (posts:[AnyObject]!, erro: NSError!) -> Void in
            self.listaPosts = NSArray(array: posts)
            
        }*/
    }
    
    func atualizarLista() {
        
        let query = PFQuery(className: "Post")
        query.includeKey("usuarioOrigem")
        query.includeKey("createdAt")
        self.listaPosts = NSArray(array: query.findObjects())
        println("OK")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return listaPosts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CelulaPostTableViewCell = tableView.dequeueReusableCellWithIdentifier("celula", forIndexPath: indexPath) as CelulaPostTableViewCell

        let post = listaPosts[indexPath.row] as PFObject
        cell.lblusuario.text = (post["usuarioOrigem"] as PFUser).username
        cell.lblData.text = post["createdAt"] as? String
        println(post["createdAt"])
        let imgSalva = post["imagem"] as PFFile

        imgSalva.getDataInBackgroundWithBlock { (imagemDown: NSData!, error) -> Void in
            cell.imgPost.image = UIImage(data: imagemDown)
        }
        
        
        return cell
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
