//
//  ViewController.swift
//  Instagram
//
//  Created by DeviOS on 14/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    @IBOutlet weak var imagemSelecionada: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gerenciarUsuarioLogado()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.imagemSelecionada.image = image
        picker.dismissViewControllerAnimated(true, completion: { () -> Void in })
    }

    @IBAction func chamarCamera(sender: UIBarButtonItem) {
        
        let imgPick = UIImagePickerController()
        imgPick.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imgPick.allowsEditing = false
        
        imgPick.delegate = self
        self.presentViewController(imgPick, animated: true) { () -> Void in
            
        }
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!){
        signUpController.dismissViewControllerAnimated(true, completion: { () -> Void in })
    }
    
    //validar cadastrar novo usu
    func signUpViewController(signUpController: PFSignUpViewController!, shouldBeginSignUp info: [NSObject : AnyObject]!) -> Bool
    {
        let dados = info as NSDictionary
        
        for (chave, valor) in dados{
            if let campo = dados.objectForKey(chave) as? NSString{
                if campo.length == 0{
                    ExibirAlerta("Error", mensagemExibir: "Preencha todos os campos")
                    return false
                }                
            }
        }
        
        return true
    }
    
    //CONSEGUIU FAZER LOGIN
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        logInController.dismissViewControllerAnimated(true, completion: { () -> Void in })
    }
    
    //ERROR NO LOGIN
    func logInViewController(logInController: PFLogInViewController!, didFailToLogInWithError error: NSError!)
    {
        ExibirAlerta("Error", mensagemExibir: "Dados invalidos")
    }
    
    
    func ExibirAlerta(titulo: String, mensagemExibir: String){
        var alert = UIAlertView(title: titulo, message: mensagemExibir, delegate: nil, cancelButtonTitle: "Fechar")
        alert.show()
    }
    
    @IBAction func sairDoApp(sender: AnyObject) {
        PFUser.logOut()
        gerenciarUsuarioLogado()
    }
    
    func gerenciarUsuarioLogado(){
        
        if PFUser.currentUser() == nil{
            let loginViewControler = PFLogInViewController()
            loginViewControler.fields = PFLogInFields.UsernameAndPassword | PFLogInFields.SignUpButton
                | PFLogInFields.LogInButton | PFLogInFields.PasswordForgotten
                //| PFLogInFields.Twitter | PFLogInFields.Facebook
            
            
            let cadastrarNovoViewControler = PFSignUpViewController()
            cadastrarNovoViewControler.delegate = self
            loginViewControler.signUpController = cadastrarNovoViewControler
            
            
            loginViewControler.delegate = self
            self.presentViewController(loginViewControler, animated: true) { () -> Void in }
        }
    }
    
}

