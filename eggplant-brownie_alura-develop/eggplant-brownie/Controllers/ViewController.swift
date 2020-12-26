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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
   
     // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView?
    
    
    
    // MARK: - Atributos
    
    var delegate: AdicionaRefeicaoDelegate? //deixar a variavel e opcional
//    var itens: [String] = ["Molho de Tomate", "Queijo", "Picles", "Manjericao"]
    
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),
                        Item(nome: "Queijo", calorias: 40.0),
        Item(nome: "Molho apimentado", calorias: 40.0),
        Item(nome: "Manjericao", calorias: 40.0)]
    
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: View Life Cycle - view já foi carregada neste caso
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItens(){
        
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)

    }
    
    func add(_ item: Item) {
        itens.append(item)
        itensTableView?.reloadData()
        if let tableView = itensTableView{
            tableView.reloadData()
        } else {
            let alerta = UIAlertController(title: "Desculpe", message: "Nao foi possivel atualizar a tabela", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alerta.addAction(ok)
            present(alerta, animated: true, completion: nil)
        }
    }
    
    // MARK:- UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    
    // MARK:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let celula = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        if celula.accessoryType == .none {
        celula.accessoryType = .checkmark
            
            let linhaDaTabela = indexPath.row
            itensSelecionados.append(itens[linhaDaTabela])
            
        } else{
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.index(of: item){
                itensSelecionados.remove(at: position)
                
//                for itemSelecionado in itensSelecionados {
//
//                    print(itemSelecionado.nome)
//                } //teste para ver se a delecao esta funcionando
            }
        }
    }
    
    // MARK: - IBActions
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nomeDaRefeicao = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }
        
        let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
       refeicao.itens = itensSelecionados
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true) //informa que o botão deve retornar para a primeira tela
        
    }
}
