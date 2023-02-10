//
//  ViewController.swift
//  HomeWork7
//
//  Created by Al Pacino on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonCount = 0

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupHeader()
        setupButton()
    }
    @IBAction func button(_ sender: Any) {
        buttonCount += 1
        pressedButtonCount()
        
    }
    
    func setupHeader() {
        pressedButtonCount()
    }
    func setupButton() {
        button.backgroundColor = UIColorFromRGB(rgbValue: 0x9bfaf8)
    }
    
    func pressedButtonCount() {
        header.text = "Нажатий: \(buttonCount)"
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xff0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0xff0000) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0xff0000) / 255.0,
        alpha: 1.0)
    }


}

