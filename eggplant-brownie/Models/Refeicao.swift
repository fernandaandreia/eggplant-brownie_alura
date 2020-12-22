//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 21/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class Refeicao: NSObject {
   
//Atributos
        let nome: String
        let felicidade: Int
        var itens: Array <Item> = []

//Metodo construtor
    init(nome: String, felicidade: Int, itens: [Item] = []) {
            self.nome = nome
            self.felicidade = felicidade
            self.itens = itens
        }
        
// Métodos para calcular a caloria
//verificar onde está a informacao onde quero calcular
        func totalDeCalorias () -> Double{
            var total = 0.0
            
            for item in itens {
                total += item.calorias
            }
            return total
        }
    }

