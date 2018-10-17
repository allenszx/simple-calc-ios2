//
//  ViewController.swift
//  simple-calc
//
//  Created by applemac on 10/17/18.
//  Copyright © 2018 AllenShi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBOutlet weak var display: UILabel!
  var tempDisplay = ""
  var resultShowed = false
  
  @IBAction func pressNum(_ sender: UIButton) {
    if resultShowed {
      display.text = ""
      resultShowed = false
    }
    var num = String(sender.tag)
    if sender.tag == -1 {
      num = "."
    }
    tempDisplay += num
    display.text = tempDisplay
  }
  
  @IBAction func pressOp(_ sender: UIButton) {
    if resultShowed {
      display.text = ""
      resultShowed = false
    }
    switch sender.tag {
    case 1:
      tempDisplay += " + "
    case 2:
      tempDisplay += " / "
    case 3:
      tempDisplay += " - "
    case 4:
      tempDisplay += " % "
    case 5:
      tempDisplay += " * "
    case 6:
      tempDisplay += " avg "
    case 7:
      tempDisplay += " fact "
    case 8:
      tempDisplay += " count "
    default:
      return
    }
    display.text = tempDisplay
  }
  @IBAction func pressCalc(_ sender: Any) {
  
    var items = tempDisplay.split(separator: " ")
    var result = 0.0
    switch items[1] {
    case "+":
      result = Double(items[0])! + Double(items[2])!
    case "-":
      result = Double(items[0])! - Double(items[2])!
    case "/":
      result = Double(items[0])! / Double(items[2])!
    case "*":
      result = Double(items[0])! * Double(items[2])!
    case "avg":
      let numCount = (items.count + 1) / 2
      for i in 1...numCount {
        result += Double(items[i * 2 - 2])!
      }
      result /= Double(numCount)
    case "fact":
      result = factorial(Int(items[0])!)
    case "count":
      result = Double((items.count + 1) / 2)
    default:
      return
    }
    resultShowed = true
    tempDisplay = ""
    display.text = String(result)
  }
  
  func factorial(_ n: Int) -> Double {
    if n == 0 {
      return 1
    }
    var a: Double = 1
    for i in 1...n {
      a *= Double(i)
    }
    return a
  }
}
