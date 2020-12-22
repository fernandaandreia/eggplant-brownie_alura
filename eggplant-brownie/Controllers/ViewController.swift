//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 17/12/20. :DDD
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableViewController: RefeicoesTableViewController? //deixar a variavel e opcional
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        tableViewController?.add(refeicao)
        
        navigationController?.popViewController(animated: true) //informa que o botão deve retornar para a primeira tela
        
    }
}
