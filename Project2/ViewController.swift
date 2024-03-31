//
//  ViewController.swift
//  Project2
//
//  Created by Will Kembel on 3/24/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button3: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button1: UIButton!
    
    var countries = [String]()
    var correctAnswerIdx = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", 
                      "italy", "monaco", "nigeria", "poland",
                      "russia", "spain", "uk", "us"]
        
        button1.sizeToFit()
        button2.sizeToFit()
        button3.sizeToFit()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
       
        askQuestion()
    }
    
    func askQuestion(_ alert: UIAlertAction! = nil) {
        // randomize flags
        //
        countries.shuffle()
        
        // make country of flag to choose visible
        //
        correctAnswerIdx = Int.random(in: 0...2)
        title = countries[correctAnswerIdx].uppercased()
        
        // prompt flag options
        //
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var submissionResult: String
        
        // allocate result
        //
        if sender.tag == correctAnswerIdx {
            submissionResult = "Correct!"
            score += 1
        }
        else {
            submissionResult = "Wrong!"
            score -= 1
        }
        
        // prompt user
        //
        let ac = UIAlertController(title: submissionResult, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    
}

