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
    var arrayImagens: [UIImageView] = []
    var larguraImg: CGFloat = 0.0
    var posicoesAnteriores: [Int] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blueColor()
        
        MontarTela()
        
    }

    func MontarTela(){
        
        larguraImg = (self.view.frame.width -  18) / 3
        
        
        
        for (var i: Int = 0; i < 9; i++){
            if(arrayImagens.isEmpty){
                self.minhaImagem = UIImageView(frame: CGRect(x: 9, y: 70, width: larguraImg, height: 120))
            }
            else{
                if(i == 3 ){
                        self.minhaImagem = UIImageView(frame: CGRect(x: 9  ,
                            y: CGFloat(71) + self.minhaImagem.frame.size.height , width: larguraImg, height: self.minhaImagem.frame.size.height))
                }
                else{
                    if(i == 6){
                        self.minhaImagem = UIImageView(frame: CGRect(x: 9  ,
                         y: CGFloat(96 * 2) + self.minhaImagem.frame.size.height , width: larguraImg, height: self.minhaImagem.frame.size.height))

                    }
                    else{
                        self.minhaImagem = UIImageView(frame: CGRect(x: self.minhaImagem.frame.origin.x + 1 + larguraImg,
                            y: self.minhaImagem.frame.origin.y , width: larguraImg, height: self.minhaImagem.frame.size.height))
                    }
                }
            }
            self.minhaImagem.image = UIImage(named: listaDeImagens[i])
            arrayImagens.append(self.minhaImagem);
            posicoesAnteriores.append(i)
            self.view.addSubview(arrayImagens.last!)
        }
        
        
        let meuBotao = UIButton.buttonWithType(UIButtonType.System) as UIButton
        
        meuBotao.setTitle("Modificar Imagem", forState: UIControlState.Normal)
        meuBotao.frame = CGRect(x:0, y:0, width: 180, height:20)
        meuBotao.center = self.view.center
        meuBotao.addTarget(self, action: "ModificarImagem", forControlEvents: UIControlEvents.TouchUpInside)
        meuBotao.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(meuBotao)
        
    }
    
    func ModificarImagem(){

       for (var i: Int = 0; i < 9; i++){
            arrayImagens[i].image = UIImage(named: DefinirNovaPosicao(i))
        }
        
        
        if(posicoesAnteriores[0] == posicoesAnteriores[1] && posicoesAnteriores[1] == posicoesAnteriores[2]){
            ExibirAlerta("Linha 1 Bitch")
        }
        
        if(posicoesAnteriores[3] == posicoesAnteriores[4] && posicoesAnteriores[4] == posicoesAnteriores[5]){
            ExibirAlerta("Linha 2 Bitch")
        }
        
        if(posicoesAnteriores[6] == posicoesAnteriores[7] && posicoesAnteriores[7] == posicoesAnteriores[8]){
            ExibirAlerta("Linha 3 Bitch")
        }
        
        
    }
    
    func DefinirNovaPosicao(let posicao: Int) -> String{
        
        var posicaoAleatoria = 0
        
        do{
            posicaoAleatoria = Int(arc4random_uniform(13))
            
         }while(posicaoAleatoria == posicoesAnteriores[posicao])
        
        posicoesAnteriores[posicao] = posicaoAleatoria
        return listaDeImagens[posicaoAleatoria]
    }

    
    
    func ExibirAlerta(let MensagemExibir: String){
        var alert = UIAlertController(title: "Alerta", message: MensagemExibir, preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
}