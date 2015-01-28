//
//  ViewController.swift
//  Instagram
//
//  Created by DeviOS on 14/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UITextFieldDelegate  {
    
    @IBOutlet weak var imagemSelecionada: UIImageView!
    @IBOutlet weak var descricao: UITextField!
    
    let gerenciadorLocalizacao = CLLocationManager()
    
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
    
    @IBAction func realizarUpload(sender: UIButton) {
        
        //Ignorar todas as acoes do usuario
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        //barra de progresso
        let indicadorAtividade = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        indicadorAtividade.center = self.view.center
        
        self.view.addSubview(indicadorAtividade)
        indicadorAtividade.startAnimating()
        indicadorAtividade.hidesWhenStopped = true
        
        indicadorAtividade.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        
        let imagemData = UIImagePNGRepresentation(imagemSelecionada.image)
        let imgUpload = PFFile(name: "imagem.png", data: imagemData)
        
        let novoPost = PFObject(className: "Post")
        
        novoPost["usuarioOrigem"] = PFUser.currentUser()
        novoPost["imagem"] = imgUpload
        novoPost["descricao"] = self.descricao.text
        
        novoPost["localizacao"] = PFGeoPoint(location: gerenciadorLocalizacao.location)
        
        novoPost.saveInBackgroundWithBlock { (sucesso, error) -> Void in
            if(sucesso){
                self.imagemSelecionada.image = UIImage(named: "placeholder")
                self.descricao.text = ""
                self.ExibirAlerta("Sucesso", mensagemExibir: "Imagem enviada")
                
                indicadorAtividade.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
            }
            else{
                println(error)
            }
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
        else{
            gerenciadorLocalizacao.requestWhenInUseAuthorization()
            gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
            gerenciadorLocalizacao.startUpdatingLocation()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.descricao.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.descricao.resignFirstResponder()
    }
    
}

