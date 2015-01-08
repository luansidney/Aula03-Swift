//
//  ListaTarefaViewController.swift
//  ControleTarefaManual
//
//  Created by DeviOS on 05/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit
import Realm

//var arrayTarefa:[Tarefa] = []



class ListaTarefaViewController: UIViewController, UITableViewDataSource {

    var listaTarefa: RLMResults{
        
        get {
            return Tarefa.allObjects().sortedResultsUsingProperty("data", ascending: false)
        }
    }
    
    var listaCategorias: RLMResults{
        
        get {
            return Categoria.allObjects().sortedResultsUsingProperty("nome", ascending: false)
        }
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celulaTabela = tableView.dequeueReusableCellWithIdentifier("celula") as LinhaCelulaTableViewCell
        
        let tarefaLinha = listaTarefa[UInt(indexPath.row)] as Tarefa
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        celulaTabela.lblData.text = dateFormatter.stringFromDate(tarefaLinha.data)
        celulaTabela.lblDescricao.text = tarefaLinha.descricao
        celulaTabela.lblTitulo.text = tarefaLinha.titulo
        
        celulaTabela.lblDescricao.sizeToFit()
        
        celulaTabela.lblData.sizeToFit()
        celulaTabela.lblTitulo.sizeToFit()
        
        celulaTabela.backgroundColor = self.getRandomColor()
        
        return celulaTabela
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(listaTarefa.count)
    }
    
    
    func getRandomColor() -> UIColor{
        
        let randomRed:CGFloat = CGFloat(drand48())
        
        let randomGreen:CGFloat = CGFloat(drand48())
        
        let randomBlue:CGFloat = CGFloat(drand48())
        
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 0.3)
        
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
