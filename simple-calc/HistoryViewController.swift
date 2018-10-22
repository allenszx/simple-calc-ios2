//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by applemac on 10/22/18.
//  Copyright © 2018 AllenShi. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
  
  var history: [String] = []
  
  @IBOutlet weak var textField: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
    var text = ""
    for oneHistory in history {
      text += oneHistory + "\n"
    }
    textField.text = text
    
    }
    

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let viewController = segue.destination as! ViewController
    viewController.history = history
  }

}
