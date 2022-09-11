//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questionNumber = 0
    
    let quiz = [
        Question(text: "The world is round", answer: true),
        Question(text: "Chris is cool", answer: true),
        Question(text: "Smurfs are red", answer: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quiz[0].text
        progressBar.progress = 0
    }

    @IBAction func answerButtonClicked(_ sender: UIButton) {
        let trueButtonClicked = sender.tag == 0
        
        if trueButtonClicked != quiz[questionNumber].answer {
            return
        }
        
        questionNumber += 1
        if questionNumber >= quiz.count {
            questionNumber = 0
        }
        
        progressBar.progress = Float(questionNumber) / Float(quiz.count)
        questionLabel.text = quiz[questionNumber].text
    }
}

struct Question {
    let text: String
    let answer: Bool
}

