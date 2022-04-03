//
//  WordleDataModel.swift
//  WordleClone
//
//  Created by Aaryaman Saini on 03/04/22.
//

import SwiftUI

class WordleDataModel: ObservableObject {
    @Published var guesses: [Guess] = []
    
    var keyColors = [String: Color]()
    
    init() {
        newGame()
    }
    
    //MARK: - Setup
    
    func newGame() {
        populateDefaults()
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
        
    }
    
    func enterWord(){
        
    }
    
    func removeLetterFromCurrentWord(){
        
    }
    
}


