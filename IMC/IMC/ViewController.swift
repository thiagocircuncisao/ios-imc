//
//  ViewController.swift
//  IMC
//
//  Created by Thiago Circuncisão on 27/03/19.
//  Copyright © 2019 Thiago Circuncisão. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var viewResult: UIView!
    
    var imc: Double = 0
    
    @IBAction func btResult(_ sender: Any) {
        if let weightVar = Double(weight.text!), let heightVar = Double(height.text!) {
            calculate(w: weightVar, h: heightVar)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func calculate(w: Double, h: Double){
        imc = w / (h * h)
        
        var resultString: String = ""
        var imageString: String = ""
        
        switch imc {
            case 0..<16:
                resultString = "Magreza"
                imageString = "magreza"
            case 16..<18.5:
                resultString = "Abaixo do peso"
                imageString = "abaixo"
            case 18.5..<25:
                resultString = "Peso ideal"
                imageString = "ideal"
            case 25..<30:
                resultString = "Abaixo do peso"
                imageString = "abaixo"
            default:
                resultString = "Obesidade"
                imageString = "obesidade"
        }
        
        result.text = resultString
        imageResult.image = UIImage(named: imageString)
        viewResult.isHidden = false
        view.endEditing(true)
    }


}

