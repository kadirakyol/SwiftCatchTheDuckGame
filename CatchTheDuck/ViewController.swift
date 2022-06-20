//
//  ViewController.swift
//  CatchTheDuck
//
//  Created by Kadir Akyol on 19.06.2022.
//

import UIKit

class ViewController: UIViewController {
    // Variables
    var score = 0
    var timer = Timer()
    var hideTimer = Timer()
    var counter = 0
    var duckArray = [UIImageView]()
    var highScore = 0
    
    // Views
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
        
        // Highscore Check
        
        let storedHighscore = UserDefaults.standard.object(forKey: "highscore") // key'e dikkat
        if storedHighscore == nil {
            highScore = 0
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        if let newScore = storedHighscore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore: \(highScore)"
        }
        
        
        scoreLabel.text = "Score: \(score)"
        
        // images
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
        
        // Duck Array
        
       duckArray = [duck1,duck2,duck3,duck4, duck5, duck6, duck7, duck8, duck9]
        
        
        // Timer
        counter = 10
        timeLabel.text = "\(counter)" // or. String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideDuck), userInfo: nil, repeats: true)
        
        hideDuck()
        
        
    }
    
    @objc func hideDuck() {
        
        for duck in duckArray {
            duck.isHidden = true
        }
        
        let random = Int (arc4random_uniform(UInt32(duckArray.count - 1)))
        duckArray[random].isHidden = false
        
        
    }
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score :\(score)"
    }
    
    @objc func countDown() {
        counter -= 1
        timeLabel.text = String(counter)
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for duck in duckArray {
                duck.isHidden = true
            }
            // highscore
            
            if self.score > self.highScore {
                self.highScore = self.score
                highScoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore") // key'e dikkat
                
            }
            
            
            
            // Alert
            
            let alert = UIAlertController(title: "Time's UP!", message: "Again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                // Replay Function
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = "\(self.counter)" // String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideDuck), userInfo: nil, repeats: true)
                
                
                
            }
            
            alert.addAction(replayButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
