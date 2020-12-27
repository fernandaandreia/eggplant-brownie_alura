//
//  RemoveRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 26/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class RemoveRefeicaoViewController {
    
    let controller: UIViewController
    init (controller: UIViewController){
        self.controller = controller
    }
    
    
    // MARK: Closure
    
    
    
    func exibe (_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
    
    let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
    let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
    alerta.addAction(botaoCancelar)
    let botaoRemover = UIAlertAction(title: "Remover", style: .destructive, handler: handler)
    alerta.addAction(botaoRemover)
    
    controller.present(alerta, animated: true, completion: nil)
    //completion pode configurar algo para fazer
        
    }
        
}
