//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Fernanda Andreia Nascimento on 17/12/20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet weak var felicidadeTextField: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
        
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        
        print("comi \(nome) e fiquei com felicidade: \(felicidade)")
    }
}
