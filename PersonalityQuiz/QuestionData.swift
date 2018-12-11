//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by doortje on 13/11/2018.
//  Copyright © 2018 Doortje. All rights reserved.
//

import Foundation


struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

// soorten vragen.
enum ResponseType {
    case single, multiple, ranged, image
}

// String voor de gebruiker die gekoppeld is aan het type. Zo kan een antwoord gekoppeld worden aan een Mealtype. 
struct Answer {
    var text: String
    var type: Mealtype
}

enum Mealtype: String {
    // de 4 cases waar tussen kan worden gekozen.
    case burger = "🍔", taco = "🌮", salad = "🥗", pizza = "🍕"

    // variable met switch statement. Hij switcht tussen de 4 opties. De juiste data voor de juiste uitkomst verschijnt in de laatste view.
    var definition: String {
        switch self {
        case .burger:
            return "You are a burger! You like to spend time with your friends and you are a real party animal."
        case .taco:
            return "You are a taco! You are really cozy and you love to spend time with your family."
        case .salad:
            return "You are a salad! You are the mommy of the group. You love nature and you take good care of yourself and others."
        case .pizza:
            return "You are a pizza! You love to stay home on a saturdaynight and relax on the couch."
        }
    }
}
