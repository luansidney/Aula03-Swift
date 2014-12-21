//
//  NovaTarefaViewController.swift
//  ControleTarefa
//
//  Created by DeviOS on 29/12/14.
//  Copyright (c) 2014 DeviOS. All rights reserved.
//

import UIKit

class NovaTarefaViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtDescTarefa: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func confirmarAdicao(sender: UIButton) {
        listaTarefas.append(self.txtDescTarefa.text)
        txtDescTarefa.text = nil
        txtDescTarefa.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.confirmarAdicao(UIButton())
        println("Ok")
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.txtDescTarefa.resignFirstResponder()
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
