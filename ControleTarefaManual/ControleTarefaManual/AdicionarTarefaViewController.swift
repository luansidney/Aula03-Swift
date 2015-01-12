//
//  AdicionarTarefaViewController.swift
//  ControleTarefaManual
//
//  Created by DeviOS on 07/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit
import Realm

class AdicionarTarefaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var listaCategorias: RLMResults{
        
        get {
            return Categoria.allObjects().sortedResultsUsingProperty("nome", ascending: false)
        }
    }
    
    @IBOutlet weak var txtTitulo: UITextField!

    @IBOutlet weak var ddlcategorias: UIPickerView!
    @IBOutlet weak var dtTarefa: UIDatePicker!
    @IBOutlet weak var txtDescicao: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnCancelarClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in })
        
    }
    
    
    @IBAction func btnConfirmarClick(sender: AnyObject) {
       let meuRelm = RLMRealm.defaultRealm()
        
        meuRelm.transactionWithBlock { () -> Void in
        
            let cat = self.listaCategorias[UInt(self.ddlcategorias.selectedRowInComponent(0))] as Categoria
            let tarefa = Tarefa()
            tarefa.titulo = self.txtTitulo.text
            tarefa.descricao = self.txtDescicao.text
            tarefa.data = self.dtTarefa.date
            tarefa.categoria = cat
            meuRelm.addObject(tarefa)
        }
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in })
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Int(listaCategorias.count)
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
        return (self.listaCategorias[UInt(row)] as Categoria).nome
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
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
