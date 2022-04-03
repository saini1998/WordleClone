//
//  Guess.swift
//  WordleClone
//
//  Created by Aaryaman Saini on 03/04/22.
//

import SwiftUI

struct Guess{
    let index: Int
    var word = "     "
    var bgColors = [Color](repeating: .wrong, count: 5)
    var cardsFlipped = [Bool](repeating: false, count: 5)
    var guessLetters: [String]{
        word.map{ String($0) }
    }
}

