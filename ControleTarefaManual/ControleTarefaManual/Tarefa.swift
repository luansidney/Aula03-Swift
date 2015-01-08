//
//  Tarefa.swift
//  ControleTarefaManual
//
//  Created by DeviOS on 05/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import Realm

class Tarefa: RLMObject {
    dynamic var titulo = ""
    dynamic var descricao = ""
    dynamic var data = NSDate()
    dynamic var categoria = Categoria()
    
    override class func primaryKey() -> String{
        return "titulo"
    }
    
}