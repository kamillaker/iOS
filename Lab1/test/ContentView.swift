//
//  ContentView.swift
//  test
//
//  Created by Kamilla Kerimbayeva on 11.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    let firstname: String = "Kamilla"
    let lastname: String = "Kerimbayeva"
    let birthYear: Int = 2005
    let isStudent: Bool = true
    let height: Double = 1.75
    let nationality: String = "Kazakh"
    
    let hobby: String = "listening to music, watching movies"
    let numberOfHobbies: Int = 2
    let favoriteNumber: Int = 2
    let isHobbyCreative: Bool = false
    
    var currentYear: Int {
            Calendar.current.component(.year, from: Date())
        }
        var age: Int {
            currentYear - birthYear
        }
    
    let futureGoals: String = "In the future, I aim to become a professional iOS developer. I plan to deepen my skills in Swift and SwiftUI, contribute to meaningful projects, and eventually create applications that solve real-world problems. I also hope to continuously learn and grow as a software engineer."
    
    var summary: String {
        """
        My name is \(firstname) \(lastname). I am \(age) years old, born in \(birthYear). 
        I am currently \(isStudent ? "a student" : "not a student"). 
        I enjoy \(hobby), which is \(isHobbyCreative ? "creative" : "not creative"). 
        I have \(numberOfHobbies) hobbies in total, and my favorite number is \(favoriteNumber). 
        In the future, \(futureGoals)
        """
    }
    
    var body: some View {
        ScrollView {
            Text(summary)
                .padding()
        }
        .onAppear {
            print(summary)
        }
    }
}

#Preview {
    ContentView()
}

