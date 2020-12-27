//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 21/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class Refeicao: NSObject, NSCoding {
   
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
    
  // MARK - NSCoding
    //Serializacao
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    //Desserializacao
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String //Casting porque o objeto é 'Any?'
        felicidade = aDecoder.decodeInteger (forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
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
    
    func detalhes() -> String{
        //colocar -> String para entender que é um texto
        
        var mensagem = "Felicidade: \(felicidade)"
        
        for item in itens {
            mensagem += ", \(item.nome) - calorias \(item.calorias)"
        }
        
        return mensagem
    }
    
    }

