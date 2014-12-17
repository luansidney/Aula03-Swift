//
//  meuViewController.swift
//  Aula04
//
//  Created by DeviOS on 17/12/14.
//  Copyright (c) 2014 DeviOS. All rights reserved.
//

import UIKit
class meuViewController: UIViewController{

    let listaDeImagens = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    var minhaImagem = UIImageView()
    var posicaoAnterior = Int()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        
        MontarTela()
        
    }

    func MontarTela(){
        
        self.minhaImagem = UIImageView(frame: CGRect(x: self.view.frame.width - 10 - 100, y: 80, width: 100, height: 120))
        self.minhaImagem.image = UIImage(named: listaDeImagens[0])
        self.view.addSubview(self.minhaImagem)
        
        let meuBotao = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        meuBotao.setTitle("Modificar Imagem", forState: UIControlState.Normal)
        meuBotao.frame = CGRect(x:0, y:0, width: 180, height:20)
        meuBotao.center = self.view.center
        meuBotao.addTarget(self, action: "ModificarImagem", forControlEvents: UIControlEvents.TouchUpInside)
        meuBotao.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(meuBotao)
        
    }
    
    func ModificarImagem(){

        var posicaoAleatoria = 0
        
        do{
            posicaoAleatoria = Int(arc4random_uniform(13))
        
        }while(posicaoAleatoria == posicaoAnterior)
        
        posicaoAnterior = posicaoAleatoria
        
        println(posicaoAleatoria)
        minhaImagem.image = UIImage(named: listaDeImagens[posicaoAleatoria])
        
    }

}