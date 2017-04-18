//
//  ViewController.swift
//  Calculator
//
//  Created by quanmacos on 4/15/17.
//  Copyright © 2017 quanmacos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false
    var operation = 0;
    var afterEqual = false
    
    @IBOutlet weak var label: UILabel!
    
    //Xu ly button tinh phan tram
    @IBAction func tinhPhanTram(_ sender: UIButton) {
        var percent:Double = 0;
        percent = Double(label.text!)!
        percent = percent/100
        label.text = String(percent)
    }

    //Xoa so 0 cua kieu Double
    func xoaSoKhong(temp: Double) -> String{
        let tempVar = String(format: "%g", temp)
        return tempVar
    }
    
    //Xu ly button nhap Dau Thap Phan (.)
    @IBAction func nhapDauCham(_ sender: UIButton) {
        var textResult:String = ""
        textResult = label.text!
        let countDos = textResult.characters.filter { $0 == "." }.count
        if afterEqual == true || label.text == "" {
            label.text = "0."
        }
        else if label.text != "" && countDos == 0 {
            label.text = label.text! + "."
        }
    }
    
    //Xu ly button nhap so am (-)
    @IBAction func nhapSoAm(_ sender: UIButton) {
        if(Double(label.text!)! == 0)
        {
            label.text = "0"
        }
        else if(Double(label.text!)! > 0)
            {
                label.text = "-" + String(xoaSoKhong(temp: Double(label.text!)!))
            }
            else
            {
                label.text = String(xoaSoKhong(temp: (-1) * Double(label.text!)!))
            }
        }
    
    // Nhap cac so tu 0 den 9
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    // Xu ly cac button tinh toan + - x /
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 // Chia
            {
                label.text = "/";
            }
            else if sender.tag == 13 // Nhan
            {
                label.text = "x";
            }
            else if sender.tag == 14 // Tru
            {
                label.text = "-";
            }
            else if sender.tag == 15 // Cong
            {
                label.text = "+";
            }
            operation = sender.tag
            performingMath = true;
        }
        
        //Thuc hien phep tinh va xuat ket qua
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(xoaSoKhong(temp: previousNumber / numberOnScreen))

            }
            else if operation == 13
            {
                label.text = String(xoaSoKhong(temp: previousNumber * numberOnScreen))

            }
            else if operation == 14
            {
                label.text = String(xoaSoKhong(temp: previousNumber - numberOnScreen))

            }
            else if operation == 15
            {
                label.text = String(xoaSoKhong(temp: previousNumber + numberOnScreen))
            }
        }
        
        // Button C
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

