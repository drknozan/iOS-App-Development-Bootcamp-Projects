//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by null on 25.09.2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answers = a
        self.correctAnswer = correctAnswer
    }
}
