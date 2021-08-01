//
//  ViewController.swift
//  IMC
//
//  Created by Marcio Henrique Nunes Abrantes on 27/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    @IBOutlet weak var btnCalc: UIButton!
    
    let resultMagreza = "Magreza"
    let resultABaixoDoPeso = "Abaixo do peso"
    let resultPesoIdeal = "Peso ideal"
    let resultObesidade = "Obesidade"
    
    let imageAbaixo = "abaixo"
    let imageIdeal = "ideal"
    let imageObeso = "obesidade"
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        btnCalc.layer.cornerRadius = 7
    }

    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfWeight.text!), let height = Double(tfHeight.text!) {
            imc = weight / (height * height)
            // pode ser excrito assim também: imc = weight / pow(height, 2)
            showResults()
        }
    }
    
    func showResults(){
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = resultMagreza
                image = imageAbaixo
            case 16..<18.5:
                result = resultABaixoDoPeso
                image = imageAbaixo
            case 18.5..<25:
                result = resultPesoIdeal
                image = imageIdeal
            case 25..<30:
                result = resultObesidade
                image = imageObeso
            default:
                result = resultObesidade
                image = imageObeso
                
        }
        lbResult.text = result
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
    }
    
}

