//
//  SecondViewController.swift
//  TestTabPj
//
//  Created by n.katou on 2015/12/01.
//  Copyright © 2015年 n.katou. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var twLabel: UILabel!
    @IBOutlet weak var twSubLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        twLabel.text = "Twitter"
        twSubLabel.text = "Loaded by Twitter tab"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

