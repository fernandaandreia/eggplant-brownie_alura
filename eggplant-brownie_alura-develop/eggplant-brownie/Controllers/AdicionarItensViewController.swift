//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 26/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

protocol AdicionaItensDelegate {
    //definir a casca do método
    
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - Atributos
    
    var delegate: AdicionaItensDelegate?
    
    init (delegate: AdicionaItensDelegate){
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init (coder: aDecoder)
    }
    //caso de heranca
    
    // MARK: - View life cycle - cuida do ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()

    }

// MARK: - IBAction - acao para o botao
 
    @IBAction func adicionarItem(_ sender: Any) {
        //navegar para proxima tela: navigationController.push()
        //navegar para a tela anterior: navigationController.pop()
        
        guard let nome = nomeTextField.text, let calorias = caloriasTextField.text else{
            return
        }
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            
            delegate?.add(item)
            
            navigationController?.popViewController(animated: true)
        }
        
        
    }
    
}
