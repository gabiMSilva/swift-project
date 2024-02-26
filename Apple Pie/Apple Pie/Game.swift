//
//  Game.swift
//  Apple Pie
//
//  Created by Gabriela Medeiros da Silva on 18/08/23.
//

import Foundation


struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character] = []
    var currentStateWord = [String]()
    
    init(_ word: String, _ movesAccepted: Int) {
        self.word = word
        self.incorrectMovesRemaining = movesAccepted
        updateCurrentWord()
    }
    
    mutating func playerGuessed(letter: Character){
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
        
        updateCurrentWord()
    }
    
    mutating func updateCurrentWord(){
        currentStateWord = []
        for l in word {
            if guessedLetters.contains(l) {
                currentStateWord.append(String(l))
            } else {
                currentStateWord.append(String("_"))
            }
        }
        
        
    }
}
