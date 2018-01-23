//
//  ViewController.swift
//  CalculatorForSwift
//
//  Created by hwq on 2018/1/17.
//  Copyright © 2018年 hwq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var left:Double = 0;
    private var right : Double = 0;
    private var oper : String = ""; //运算符
    private var isSecond : Bool = false; //判断是否第二个操作数

    @IBOutlet weak var cOper: UIButton!
    @IBOutlet weak var leftOper: UIButton!
    @IBOutlet weak var modeOper: UIButton!
    @IBOutlet weak var divOper: UIButton!
    @IBOutlet weak var multOper: UIButton!
    @IBOutlet weak var aplusOper: UIButton!
    @IBOutlet weak var subOper: UIButton!
    @IBOutlet weak var equalOper: UIButton!
    @IBOutlet weak var pointOper: UIButton!
    
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var zero: UIButton!
    
    @IBOutlet weak var result: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        result.adjustsFontSizeToFitWidth = true;
        self.createUI();
        
    }

    func createUI() {
        cOper.layer.borderColor = UIColor.black.cgColor;
        cOper.layer.borderWidth = 0.5;
        leftOper.layer.borderColor = UIColor.black.cgColor;
        leftOper.layer.borderWidth = 0.5;
        modeOper.layer.borderColor = UIColor.black.cgColor;
        modeOper.layer.borderWidth = 0.5;
        aplusOper.layer.borderColor = UIColor.black.cgColor;
        aplusOper.layer.borderWidth = 0.5;
        subOper.layer.borderColor = UIColor.black.cgColor;
        subOper.layer.borderWidth = 0.5;
        divOper.layer.borderColor = UIColor.black.cgColor;
        divOper.layer.borderWidth = 0.5;
        seven.layer.borderColor = UIColor.black.cgColor;
        seven.layer.borderWidth = 0.5;
        eight.layer.borderColor = UIColor.black.cgColor;
        eight.layer.borderWidth = 0.5;
        nine.layer.borderColor = UIColor.black.cgColor;
        nine.layer.borderWidth = 0.5;
        four.layer.borderColor = UIColor.black.cgColor;
        four.layer.borderWidth = 0.5;
        five.layer.borderColor = UIColor.black.cgColor;
        five.layer.borderWidth = 0.5;
        six.layer.borderColor = UIColor.black.cgColor;
        six.layer.borderWidth = 0.5;
        two.layer.borderColor = UIColor.black.cgColor;
        two.layer.borderWidth = 0.5;
        one.layer.borderColor = UIColor.black.cgColor;
        one.layer.borderWidth = 0.5;
        three.layer.borderColor = UIColor.black.cgColor;
        three.layer.borderWidth = 0.5;
        zero.layer.borderWidth = 0.5;
        zero.layer.borderColor = UIColor.black.cgColor;
    }

    @IBAction func operatorClicked(_ sender: UIButton) {
        if sender.titleLabel?.text! == "=" {
            if oper == "÷" && right == 0 {
                result.text = "错误";
            }else {
                switch oper {
                case "÷":
                    let temp = left / right;
                    result.text = "\(temp)";
                    
                case "-":
                    let temp = left - right;
                    result.text = "\(temp)";
                case "+":
                    let temp = left + right;
                    result.text = "\(temp)";
                case "×":
                    let temp = left * right;
                    result.text = "\(temp)";
                default:
                    print("error");
                }
            }
            left = 0;
            right = 0;
            oper = "";
            isSecond = false;
            let s = result.text! as NSString;
            let v = s.doubleValue;
            //结果是整数，就去掉小数点。()
            if ( (v * 100).truncatingRemainder(dividingBy: 10) ) == 0 {
                let array = s.components(separatedBy: ".");
                result.text = array[0];
            }
            
        }else if oper.isEmpty{
            isSecond = true;
            oper = sender.titleLabel!.text!;
            result.text = "0";
        }else {
            oper = sender.titleLabel!.text!;
        }
    }
    
    @IBAction func clearClicked(_ sender: UIButton) {
        result.text = "0";
        cOper.titleLabel?.text = "AC";
        if(isSecond){
            result.text = "0";
            right = 0;
           // isSecond = false;
        }else{
            left = 0;
            result.text = "0";
        }
    }
    
    
    @IBAction func oneOperatorClicked(_ sender: UIButton) {
        cOper.titleLabel?.text = "C";
        switch sender.titleLabel!.text! {
        case "%":
            let res = left / 100;
            result.text = "\(res)";
            left = 0;
        case "+/-":
            if (isSecond){
                var res = result.text! as NSString;
                var nres = res.doubleValue;
                if nres > 0 {
                    result.text = "-" + result.text!;
                    res = result.text! as NSString;
                    nres = res.doubleValue;
                    right = nres;
                }else {
                    let rs = result.text!;
                    let sub = rs.index(rs.startIndex, offsetBy: 1);
                    result.text = String(rs.suffix(from: sub));
                    res = result.text! as NSString;
                    nres = res.doubleValue;
                    right = nres;
                }
            }else {
             
                    var res = result.text! as NSString;
                    var nres = res.doubleValue;
                    if nres > 0 {
                        result.text = "-" + result.text!;
                        res = result.text! as NSString;
                        nres = res.doubleValue;
                        left = nres;
                    }else if nres < 0 {
                        let rs = result.text!;
                        let sub = rs.index(rs.startIndex, offsetBy: 1);
                        result.text = String(rs.suffix(from: sub));
                        res = result.text! as NSString;
                        nres = res.doubleValue;
                        left = nres;
                    }else {
                        
                    }
                    
            }
        case ".":
            if isSecond {
                result.text = result.text! + ".";
                let value = result.text! as NSString;
                right = value.doubleValue;
            }else {
                result.text = result.text! + ".";
                let value = result.text! as NSString;
                left = value.doubleValue;
            }
        default:
            print("error");
        }
        
        
        
    }
    
    @IBAction func valueClicked(_ sender: UIButton) {
        cOper.titleLabel?.text = "C";
        if result.text?.count == 11 {
            return;
        }
        if (isSecond) {
            
            if (result.text == "0"){
                result.text = sender.titleLabel?.text;
                let value = result.text! as NSString;
                right = value.doubleValue;
            }else {
                result.text = result.text! + sender.titleLabel!.text!;
                let value = result.text! as NSString;
                right = value.doubleValue;
            }
        }else {
            if (result.text == "0"){
                result.text = sender.titleLabel?.text;
                let value = result.text! as NSString;
                left = value.doubleValue;
            }else {
                result.text = result.text! + sender.titleLabel!.text!;
                let value = result.text! as NSString;
                left = value.doubleValue;
            }
        }
        
    }
    
}

