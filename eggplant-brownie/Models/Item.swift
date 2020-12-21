//
//  Item.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 21/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class Item: NSObject {
//Atributo
    let nome: String
    let calorias: Double

//Metodo Construtor
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
}
