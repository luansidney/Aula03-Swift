//
//  AdicionarTarefaViewController.swift
//  ControleTarefaManual
//
//  Created by DeviOS on 07/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit
import Realm

class AdicionarTarefaViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!

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
            
            let cat = Categoria()
            cat.nome = "Importante"
            
            meuRelm.addOrUpdateObject(cat)
            
            let tarefa = Tarefa()
            tarefa.titulo = self.txtTitulo.text
            tarefa.descricao = self.txtDescicao.text
            tarefa.data = self.dtTarefa.date
            tarefa.categoria = cat
            meuRelm.addObject(tarefa)
        }
        
        self.dismissViewControllerAnimated(true, completion: { () -> Void in })
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
