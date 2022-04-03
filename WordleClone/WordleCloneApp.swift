//
//  WordleCloneApp.swift
//  WordleClone
//
//  Created by Aaryaman Saini on 26/03/22.
//

import SwiftUI

@main
struct WordleCloneApp: App {
    
    @StateObject var dm = WordleDataModel()
    
    var body: some Scene {
        WindowGroup {
            GameView()
                .environmentObject(dm)
        }
    }
}
