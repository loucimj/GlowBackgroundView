//
//  ViewController.swift
//  GlowBackgroundView
//
//  Created by Javier Loucim on 9/8/17.
//  Copyright © 2017 Qeeptouch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var glowView: UIView!
    @IBOutlet weak var commonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        glowView.glowBackground = UIColor.red
        commonView.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

