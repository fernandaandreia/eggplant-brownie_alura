//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 26/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func exibe() {
        let alerta = UIAlertController(title: "Desculpe", message: "Nao foi possivel atualizar a tabela", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
