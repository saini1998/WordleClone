//
//  WordleDataModel.swift
//  WordleClone
//
//  Created by Aaryaman Saini on 03/04/22.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    @Published var incorrectAttempts = [Int](repeating: 0, count: 6)
    
    var keyColors = [String: Color]()
    var selectedWord = ""
    var currentWord = ""
    var tryIndex = 0
    var inPlay = false
    var gameOver = false
    
    var gameStarted:Bool {
        !currentWord.isEmpty || tryIndex > 0
    }
    
    var disabledKeys: Bool {
        !inPlay || currentWord.count == 5
    }
    
    init() {
        newGame()
    }
    
    //MARK: - Setup
    
    func newGame() {
        populateDefaults()
        selectedWord = Global.commonWords.randomElement()!
        currentWord = ""
        inPlay = true
    }
    
    func populateDefaults() {
        guesses = []
        for index in 0...5{
            guesses.append(Guess(index: index))
            
        }
        //reset keyboard colors
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for char in letters{
            keyColors[String(char)] = .unused
        }
    }
    
    //MARK: - Game Play
    
    func addToCurrentWord(_ letter: String){
        currentWord += letter
        updateRow()
    }
    
    func enterWord(){
        
        if currentWord == selectedWord{
            gameOver = true
            print("you win")
            setCurrentGuessColors()
            inPlay = false
        } else {
            if verifyWord(){
                print("Valid Word")
                setCurrentGuessColors()
                tryIndex += 1
                if tryIndex == 6{
                    gameOver = true
                    inPlay = false
                    print("you lose")
                }
            }else{
                withAnimation{
                    self.incorrectAttempts[tryIndex] += 1
                }
                incorrectAttempts[tryIndex] = 0
            }
        }
    }
    
    func removeLetterFromCurrentWord(){
        currentWord.removeLast()
        updateRow()
    }
    
    func updateRow() {
        let guessWord = currentWord.padding(toLength: 5, withPad: " ", startingAt: 0)
        guesses[tryIndex].word = guessWord
    }
    
    func verifyWord() -> Bool{
        UIReferenceLibraryViewController.dictionaryHasDefinition(forTerm: currentWord)
    }
    
    func setCurrentGuessColors() {
        let correctLetters = selectedWord.map {String($0)}
        var frequency = [String : Int]()
        for letter in correctLetters{
            frequency[letter, default:0] += 1
        }
        
        for index in (0...4) {
            let correctLetter = correctLetters[index]
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if guessLetter == correctLetter{
                guesses[tryIndex].bgColors[index] = .correct
                frequency[guessLetter]! -= 1
            }
        }
        
        for index in (0...4) {
            let guessLetter = guesses[tryIndex].guessLetters[index]
            if  correctLetters.contains(guessLetter) && guesses[tryIndex].bgColors[index] != .correct && frequency[guessLetter]! > 0{
                guesses[tryIndex].bgColors[index] = .misplaced
                frequency[guessLetter]! -= 1
            }
        }
        
        print(selectedWord)
        print(guesses[tryIndex].word)
    }
    
}


