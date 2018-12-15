//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by doortje on 13/11/2018.
//  Copyright © 2018 Doortje. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    
    // Outlets voor alle labels, buttons en stackviews. Deze zijn aangemaakt zodat er mee gewerkt en ge-edit kan worden.
    @IBOutlet weak var questionLabel: UILabel!
    
    // Single vragen.
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    // Multiple vragen.
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBOutlet weak var multiSubmitButton: UIButton!
    // Ranged vragen.
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    @IBOutlet weak var rangedSubmitButton: UIButton!
    
    // Single Image vragen
    @IBOutlet weak var imageStackView: UIStackView!
    @IBOutlet weak var singleImage1: UIButton!
    @IBOutlet weak var singleImage2: UIButton!
    @IBOutlet weak var singleImage3: UIButton!
    @IBOutlet weak var singleImage4: UIButton!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    // telt het aantal vragen.
    var questionIndex = 0
    // De vragen in de quiz.
    var questions: [Question] = [
        Question(text: "What's your favorite place to eat?",
                 // type vraag, in dit geval single.
            type:.single,
            // de mogelijke aantwoorden en aan welk type eten ze zijn gekoppeld.
            answers:[
                Answer(text: "On the couch", type: .pizza),
                Answer(text: "In a restaurant", type: .taco),
                Answer(text: "At home with friends", type: .burger),
                Answer(text: "Outside, in a park", type: .salad)
            ]),
        Question(text: "You love...",
                 // type vraag, in dit geval multiple.
            type:.multiple,
            // de mogelijke aantwoorden en aan welk type eten ze zijn gekoppeld.
            answers: [
                Answer(text: "Christmas season", type: .taco),
                Answer(text: "Netflix and Chill", type: .pizza),
                Answer(text: "Planning a trip", type: .salad),
                Answer(text: "A good party", type: .burger)
            ]),
        Question(text: "How important is healty food for you?",
                 // type vraag, in dit geval ranged.
            type:.ranged,
            // de mogelijke aantwoorden en aan welk type eten ze zijn gekoppeld.
            answers: [
                Answer(text: "Not at all", type: .pizza),
                Answer(text: "A bit", type: .burger),
                Answer(text: "I try to eat healthy", type: .taco),
                Answer(text: "I'm a health freak ", type: .salad)
            ]),
        Question(text: "Your dream house looks like..  ",
                 // type vraag, in dit geval een image en een button met tekst.
            type:.image,
            // de mogelijke aantwoorden en aan welk type eten ze zijn gekoppeld.
            answers: [
                Answer(text: "", type: .pizza),
                Answer(text: "", type: .burger),
                Answer(text: "", type: .taco),
                Answer(text: "", type: .salad)
            ]),
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Verstopt de backbutton, zodat je niet terug kan naar een vraag die al beantwoordt is.
        navigationItem.hidesBackButton = true
        // radius van de labels.
        
        singleButton1.layer.cornerRadius = 5.0
        singleButton2.layer.cornerRadius = 5.0
        singleButton3.layer.cornerRadius = 5.0
        singleButton4.layer.cornerRadius = 5.0
        rangedSubmitButton.layer.cornerRadius = 5.0
        multiSubmitButton.layer.cornerRadius = 5.0
        
        
    }
    // verantwoordelijk voor het laten zien van de juiste stack view.
    func updateUI(){
        // in eerste instantie zijn alle stackviews verborgen, tenzij ze worden aangeroepen.
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        imageStackView.isHidden = true
        
        // welke vragen en antwoorden er moeten worden geladen.
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) /
            Float(questions.count)
        
        // Vragen label en question number.
        navigationItem.title = "Question number \(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Switch statement om te wisselen tussen de 3 vragen.
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        case .image:
            updateImageStack(using: currentAnswers)
        }
    }
    
    // Zodra de single vraag wordt aangeroepen wordt de stackview weergegeven. In de stackview worden de juiste titels aan de buttons gegeven.
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    // Zodra de multiple vraag wordt aangeroepen wordt de stackview weergegeven. In de stackview worden de switches ook weergegeven en krijgen de labels van de switches de juiste titels.
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    // Zodra de ranged vraag wordt aangeroepen wordt de stackview weergegeven. De labels aan de range krijgen ook de juiste titels.
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    // Zodra de Image vraag wordt aangeroepen wordt de stackview weergegeven.
    func updateImageStack(using answers: [Answer]) {
        imageStackView.isHidden = false
        singleImage1.setTitle(answers[3].text, for: .normal)
        singleImage2.setTitle(answers[1].text, for: .normal)
        singleImage3.setTitle(answers[0].text, for: .normal)
        singleImage4.setTitle(answers[2].text, for: .normal)
    }
    
    // property waarin de Answers worden opgeslagen.
    var answersChosen: [Answer] = []
    
    
    // Single answer button code:
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        // Geeft aan welke button de actie aangeroepen heeft. Zo kan de button die gekozen is gekoppeld worden aan het antwoord van de gebruiker, het antwoord kan worden opgeslagen om later het resultaat van de quiz te berekenen.
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        // Nadat het antwoord is opgegeven wordt de volgende vraag aangeroepen.
        nextQuestion()
    }
    
    // Multiple answer button code:
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        // Geeft aan welke slides worden geactiveerd. Zo kunnen de slides die gekozen zijn gekoppeld worden aan het antwoord van de gebruiker, het antwoord kan worden opgeslagen om later het resultaat van de quiz te berekenen.
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        // Nadat het antwoord is opgegeven wordt de volgende vraag aangeroepen.
        nextQuestion()
    }
    
    
    // Ranged answer button code:
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        // Geeft aan in welke range een antwoord gekozen is. Zo kan de range die gekozen is gekoppeld worden aan het antwoord van de gebruiker, het antwoord kan worden opgeslagen om later het resultaat van de quiz te berekenen.
        let index = Int(round(rangedSlider.value *
            Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        // Nadat het antwoord is opgegeven wordt de volgende vraag aangeroepen.
        nextQuestion()
    }
    
    @IBAction func ImageButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        // Geeft aan welke button de actie aangeroepen heeft. Zo kan de button die gekozen is gekoppeld worden aan het antwoord van de gebruiker, het antwoord kan worden opgeslagen om later het resultaat van de quiz te berekenen.
        switch sender {
        case singleImage1:
            answersChosen.append(currentAnswers[3])
        case singleImage2:
            answersChosen.append(currentAnswers[1])
        case singleImage3:
            answersChosen.append(currentAnswers[0])
        case singleImage4:
            answersChosen.append(currentAnswers[2])
        default:
            break
        }
        // Nadat het antwoord is opgegeven wordt de volgende vraag aangeroepen.
        nextQuestion()
    }
    
    
    func nextQuestion() {
        // QuestionIndex telt er 1 bij op nadat nextQuestion weer is aangeroepen, zo wordt bijgehouden bij welke vraag de gebruiker is.
        questionIndex += 1
        
        
        if questionIndex < questions.count {
            updateUI()
            // Als de questionIndex groter is dan het aantal vragen wordt de Segue uitgevoerd om naar de ResultsViewController te gaan.
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "ResultsSegue" {
            // AnswerChosen wordt meegegeven aan ResultsViewController met de juiste antwoorden van de gebruiker.
            let resultsViewController = segue.destination as!
            ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
    
    
}
