//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 26/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class AdicionarItensViewController: UIViewController {

    
    // MARK: - View life cycle - cuida do ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()

    }

// MARK: - IBAction - acao para o botao
 
    @IBAction func adicionarItem(_ sender: Any) {
        //navegar para proxima tela: navigationController.push()
        //navegar para a tela anterior: navigationController.pop()
        
        navigationController?.popViewController(animated: true)
    }
    
}
