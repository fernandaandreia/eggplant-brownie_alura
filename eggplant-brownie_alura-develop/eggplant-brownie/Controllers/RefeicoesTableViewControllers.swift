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
    
    override func viewDidLoad() {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        do {
             let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try  NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return }
            
            refeicoes = refeicoesSalvas
            
        } catch {
            print(error.localizedDescription)
        }
       
    }
    
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
        
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return }
        let caminho = diretorio.appendingPathComponent("refeicao")
        
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
           try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        } //implementacao para salvar as info
        
        
    }
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == . began {
//        print("long press gesture")
            let celula = gesture.view as! UITableViewCell
            
            guard let indexPath = tableView.indexPath(for: celula)else { return }
        
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: {
                alert in
                self.refeicoes.remove(at: indexPath.row)
                self .tableView.reloadData()
            })
            
        }
        
    }
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController {
            viewController.delegate = self
        }
}
}

// _ serve para tornar o código menos repetitivo underline + espaço 
