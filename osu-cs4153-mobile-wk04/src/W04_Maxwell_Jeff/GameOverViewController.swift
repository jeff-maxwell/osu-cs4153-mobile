//
//  GameOverViewController.swift
//  W04_Maxwell_Jeff
//
//  Created by Jeff Maxwell on 9/13/18.
//  Copyright © 2018 Oklahoma State University - Mobile Development. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {

    var finalScore: Int = 0
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        finalScoreLabel.text = String(finalScore)
    }
}
