//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 17/12/20. :DDD
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao) //apenas a definiçao do método - este é um protocolo de comunicação
}

class ViewController: UIViewController {
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate? //deixar a variavel e opcional
    
    // MARK: - IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true) //informa que o botão deve retornar para a primeira tela
        
    }
}
