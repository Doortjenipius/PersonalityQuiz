//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by doortje on 13/11/2018.
//  Copyright © 2018 Doortje. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
 
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    
// Property die de antwoorden opslaat.
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
// roept de functie van resultaat van de quiz op.
        calculatePersonalityResult()
// Verstopt de backbutton, zodat je niet terug kan naar een vraag die al beantwoordt is.
        navigationItem.hidesBackButton = true

    }
    
    
    func calculatePersonalityResult () {
// Houdt bij hoe vaak een antwoord voor een bepaald MealType is gegeven.
        var frequencyOfAnswers: [Mealtype: Int] = [:]
// pakt alleen de type van het struct Answers.
        let responseTypes = responses.map { $0.type }
// telt hoe vaak elk Mealtype voorkomt.
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]
        ?? 0) + 1
    }
// berekent welk Mealtype het meest voorkomt.
    let frequentAnswersSorted = frequencyOfAnswers.sorted (by:
            { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
        })
    
// Meest voorkomende antwoord
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 >
            $1.1 }.first!.key
    
// Label die het resultaat van de quiz weergeeft.
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition

    }

}
