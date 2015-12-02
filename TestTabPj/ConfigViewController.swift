//
//  ConfigViewController.swift
//  TestTabPj
//
//  Created by n.katou on 2015/12/02.
//  Copyright © 2015年 n.katou. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    @IBOutlet weak var configLabel: UILabel!
    @IBOutlet weak var configSubLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configLabel.text = "Config"
        configSubLabel.text = "Loaded by Configuration tab"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
