//
//  ListaJogosTableViewController.swift
//  
//
//  Created by DeviOS on 02/02/15.
//
//

import UIKit
import Alamofire
import SwiftyJSON

let kURLBase = "http://www.giantbomb.com.br/api/"
let kAPIKey = "?api_key=39a4bc751807079f1373b6a89948064022e97b49&format=json"

class ListaJogosTableViewController: UITableViewController {
    
    var listaJogos: [JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       Alamofire.request(.GET, kURLBase + "games" + kAPIKey).responseSwiftyJSON { (request, response, json, erro) -> Void in
            let jogos = json["results"].array!
            self.listaJogos = jogos
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
        return listaJogos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("celulaJogos", forIndexPath: indexPath) as UITableViewCell

        let umJogo = self.listaJogos[indexPath.row].dictionaryValue
        
        cell.textLabel?.text = umJogo["nome"]?.string
        cell.imageView?.image = UIImage(named: umJogo["cover_large"]?.string)

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
