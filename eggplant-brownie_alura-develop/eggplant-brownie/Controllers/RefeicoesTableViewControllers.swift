//
//  RefeicoesTableViewControllers.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 21/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Macarrão", felicidade: 4, itens: []),
                     Refeicao(nome: "Pizza", felicidade: 4, itens: []),
                     Refeicao(nome: "Comida Japonesa", felicidade: 5, itens: [])]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:))) //gesto longo
        
        celula.addGestureRecognizer(longPress)
        
        return celula

    }
    
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == . began {
//        print("long press gesture")
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula)else { return }
        
            let refeicao = refeicoes[indexPath.row]
            
//            print("Refeicao: \(refeicao.nome)")
            
            let alerta = UIAlertController(title: refeicao.nome, message: "Felicidade: \(refeicao.felicidade)", preferredStyle: .alert)
            
             let botaoCancelar = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(botaoCancelar)
            
            present(alerta, animated: true, completion: nil)
                //completion pode configurar algo para fazer
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
}
}

// _ serve para tornar o código menos repetitivo underline + espaço 
