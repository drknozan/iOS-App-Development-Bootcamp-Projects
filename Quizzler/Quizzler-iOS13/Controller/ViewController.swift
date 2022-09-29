//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            questionLabel.textColor = UIColor.green
        } else {
            questionLabel.textColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        firstAnswerButton.isEnabled = false
        
        secondAnswerButton.isEnabled = false
        
        thirdAnswerButton.isEnabled = false
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        firstAnswerButton.setTitle(quizBrain.getAnswersText()[0], for: .normal)
        
        secondAnswerButton.setTitle(quizBrain.getAnswersText()[1], for: .normal)
        
        thirdAnswerButton.setTitle(quizBrain.getAnswersText()[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        questionLabel.textColor = UIColor.white
        
        firstAnswerButton.isEnabled = true
        
        secondAnswerButton.isEnabled = true
        
        thirdAnswerButton.isEnabled = true
    }
}

