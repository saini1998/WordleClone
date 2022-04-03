//
//  Colors+Extensions.swift
//  WordleClone
//
//  Created by Aaryaman Saini on 03/04/22.
//

import SwiftUI

extension Color{
    static var wrong: Color{
        Color(UIColor(named: "wrong")!)
    }
    static var misplaced: Color{
        Color(UIColor(named: "misplaced")!)
    }
    static var unused: Color{
        Color(UIColor(named: "unused")!)
    }
    static var correct: Color{
        Color(UIColor(named: "correct")!)
    }
    static var systemBackground: Color{
        Color(.systemBackground)
    }
}
