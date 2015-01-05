//
//  ListaTarefaViewController.swift
//  ControleTarefaManual
//
//  Created by DeviOS on 05/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class ListaTarefaViewController: UIViewController, UITableViewDataSource {

    var arrayTarefa:[Tarefa] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let tarefa1 = Tarefa(titulo: "Titulo 01", descricao: "Desc 01", data: "05/01/2015")
        arrayTarefa.append(tarefa1)
        
        let tarefa2 = Tarefa(titulo: "Titulo 02", descricao: "Desc 02", data: "15/01/2015")
        arrayTarefa.append(tarefa2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celulaTabela = tableView.dequeueReusableCellWithIdentifier("celula") as LinhaCelulaTableViewCell
        
        let tarefaLinha = arrayTarefa[indexPath.row]
        
        celulaTabela.lblData.text = tarefaLinha.data
        celulaTabela.lblDescricao.text = tarefaLinha.descricao
        celulaTabela.lblTitulo.text = tarefaLinha.titulo
        
        celulaTabela.lblDescricao.sizeToFit()
        
        celulaTabela.lblData.sizeToFit()
        celulaTabela.lblTitulo.sizeToFit()
        return celulaTabela
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTarefa.count
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
