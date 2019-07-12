//
//  QuizController.swift
//  FRIENDS trivia game
//
//  Created by GWC on 7/10/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

struct Question{
    var title: String
    var answers: [String]
    var correctAnswer: Int
}

class QuizController: UIViewController {

    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    
    let questions: [Question] = [
        Question(title: "In which city is Friends set?", answers: ["LA", "New York City", "Miami", "Seattle"], correctAnswer: 1),
        Question(title: "What's the name of the coffee shop used by the characters?", answers: ["Coffee and Tea", "Central Park", "Central Perk", "Starbucks"], correctAnswer: 2),
        
        Question(title: "What is Janice most likely to say?", answers: ["No way!", "Leave me alone!", "Get me coffee!", "Oh...my...God!"], correctAnswer: 3),
        
        Question(title: "What does Joey never share?", answers: ["His food", "His chair", "His chlothes", "His books"], correctAnswer: 0),
        
        Question(title: "What was Ross's pets monkeys name?", answers: ["Keith", "Marcel", "Bob", "Lance"], correctAnswer: 1),
        
        Question(title: "What was the name of Chandler's roomate when Joey left?", answers: ["Marley", "Frankie", "Eddie", "Joseph"], correctAnswer: 2),
        
        Question(title: "What's the title of the Friend's theme song?", answers: ["I'll Be There For You", "I'll Be There For Them", "I'll Be There For Those", "I'll Be There For That"], correctAnswer: 0),
        
        Question(title: "What's the name of Phoebe's alter-ego?", answers: ["Elaine Benes", "Monica Bing", "Phobe Neeby", "Regina Falange"], correctAnswer: 3)
    ]
    
    var currentQuestion: Question?
    var currentIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let controller = segue.destination as! ResultController
            controller.numberCorrect = correctAnswers
            controller.total = questions.count
        }
    }
    
    func setQuestion(){
        if (currentIndex < questions.count){
            currentQuestion = questions[currentIndex]
           
            questionLabel.text = currentQuestion?.title
            answer0.setAttributedTitle(NSAttributedString(string: (currentQuestion?.answers[0])!), for: .normal)
            answer1.setAttributedTitle(NSAttributedString(string: (currentQuestion?.answers[1])!), for: .normal)
            answer2.setAttributedTitle(NSAttributedString(string: (currentQuestion?.answers[2])!), for: .normal)
            answer3.setAttributedTitle(NSAttributedString(string: (currentQuestion?.answers[3])!), for: .normal)
            
            //could also have .highlighted
            
            progressLabel.text = "\(currentIndex + 1) /\(questions.count)"
        }
        else{
            //perform segue
            performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    func nextQuestion(){
        currentIndex += 1
        setQuestion()
    }
    
    var correctAnswers:Int = 0
    
    func checkAnswer(index:Int){
        if (currentQuestion?.correctAnswer == index)
        {
            correctAnswers += 1
        }
        nextQuestion()
    }
    
    
    
    
    
    
    @IBAction func answerCoice0(_ sender: Any) {
        checkAnswer(index:0)
    }
    @IBAction func answerChoice1(_ sender: Any) {
        checkAnswer(index:1)
    }
    
    @IBAction func answerChoice2(_ sender: Any) {
        checkAnswer(index:2)
    }
    
    @IBAction func answerChoice3(_ sender: Any) {
        checkAnswer(index:3)
    }
    
    
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
