//
//  Categoria.swift
//  ControleTarefaManual
//
//  Created by DeviOS on 07/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import Realm

class Categoria: RLMObject {
    
    dynamic var nome = ""
    
    override class func primaryKey() -> String{
        return "nome"
    }
    
}
