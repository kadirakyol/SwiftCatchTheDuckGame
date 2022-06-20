//
//  ViewController.swift
//  CatchTheDuck
//
//  Created by Kadir Akyol on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var score = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var duck1: UIImageView!
    @IBOutlet weak var duck2: UIImageView!
    @IBOutlet weak var duck3: UIImageView!
    @IBOutlet weak var duck4: UIImageView!
    @IBOutlet weak var duck5: UIImageView!
    @IBOutlet weak var duck6: UIImageView!
    @IBOutlet weak var duck7: UIImageView!
    @IBOutlet weak var duck8: UIImageView!
    @IBOutlet weak var duck9: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        duck1.isUserInteractionEnabled = true
        duck2.isUserInteractionEnabled = true
        duck3.isUserInteractionEnabled = true
        duck4.isUserInteractionEnabled = true
        duck5.isUserInteractionEnabled = true
        duck6.isUserInteractionEnabled = true
        duck7.isUserInteractionEnabled = true
        duck8.isUserInteractionEnabled = true
        duck9.isUserInteractionEnabled = true
        
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        duck1.addGestureRecognizer(recognizer1)
        duck2.addGestureRecognizer(recognizer2)
        duck3.addGestureRecognizer(recognizer3)
        duck4.addGestureRecognizer(recognizer4)
        duck5.addGestureRecognizer(recognizer5)
        duck6.addGestureRecognizer(recognizer6)
        duck7.addGestureRecognizer(recognizer7)
        duck8.addGestureRecognizer(recognizer8)
        duck9.addGestureRecognizer(recognizer9)
        
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score :\(score)"
    }


}

