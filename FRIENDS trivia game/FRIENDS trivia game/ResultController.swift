//
//  ResultController.swift
//  FRIENDS trivia game
//
//  Created by GWC on 7/10/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    @IBOutlet weak var resultsMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var numberCorrect: Int = 0
    var total:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "You got \(numberCorrect) out of \(total)"
        // Do any additional setup after loading the view.
        
        let percentageRight = ((Double)(numberCorrect)/Double(total)) * 100
        var title = ""
        
        if (percentageRight<60){
            title = "Better luck next time"
        }
        else if(percentageRight<80){
            title = "Not bad!"
        }
        else if(percentageRight<100){
            title = "Good job!👍🏻"
        }
        else{
            title = "Great Job🥳🥳"
        }
        
        resultsMessageLabel.text = title
    }
    
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


