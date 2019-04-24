//
//  ViewController.swift
//  Quizze
//
//  Created by Adam Lang & David Hjorth on 2019-03-08.
//  Copyright © 2019 Adam Lang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, VCDelegate {
    
    //QUESTION
    @IBOutlet weak var labelQuestion: UILabel!
    
    //ANSWER BUTTON
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    //PROGRESSLABEL
    @IBOutlet weak var lblProgress: UILabel!
    
    var audioPlayer: AVAudioPlayer!
    
    @objc var answerButtonArray: [UIButton] = []
    
    //VARIABLES FOR FUNC
    var dataBase = QuestionsDB()
    var currentQuestion: Question?
    let maxQuestions = 30
    var currentIndex = 0
    var questionPos = 0
    var noCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSound()
        playSound()
        audioPlayer.delegate = self
        questionPos = 0
        noCorrect = 0
        answerButtonArray = [answer0, answer1, answer2, answer3]
        
        
    }
    
    //AVAUDIOPLAYER
    func loadSound() {
        if let soundUrl = Bundle.main.url(forResource: "quizzieMusic", withExtension: "wav"){
            do { audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            }catch {
                print(error)
            }
        }
    }
    //AVAUDIOPLAYER
    func playSound() {
        audioPlayer.play()
        
    }
    func stopSound() {
        audioPlayer.stop()
    }
    //AVAUDIOPLAYER
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playSound()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        noCorrect = 0
        questionPos = 0
        currentIndex = 0
        dataBase.questions.shuffle()
        setQuestion()
        
    }
    
    //ANSWER BUTTONS
    @IBAction func answerOne(_ sender: Any) {
        checkAnswer(idx: 0)
        disableButtons()
    }
    
    @IBAction func answerTwo(_ sender: Any) {
        checkAnswer(idx: 1)
        disableButtons()
    }
    
    @IBAction func answerThree(_ sender: Any) {
        checkAnswer(idx: 2)
        disableButtons()
    }
    
    @IBAction func answerFour(_ sender: Any) {
        checkAnswer(idx: 3)
        disableButtons()
    }
    
    func disableButtons() {
        answer0.isEnabled = false
        answer1.isEnabled = false
        answer2.isEnabled = false
        answer3.isEnabled = false
    }
    
    func enableButtons() {
        answer0.isEnabled = true
        answer1.isEnabled = true
        answer2.isEnabled = true
        answer3.isEnabled = true
    }
    
    func checkAnswer (idx: Int) {
        if (idx == currentQuestion!.correctAnswerIndex) {
            noCorrect += 1
        }
        
        for index in 0..<answerButtonArray.count {
            if index == currentQuestion!.correctAnswerIndex {
                noCorrect += 0
                answerButtonArray[index].backgroundColor = UIColor.green
            }else if idx == index {
                answerButtonArray[index].backgroundColor = UIColor.red
            }
        }
        
        // LOAD NEXT QUESTION TIMER
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(loadNextQuestion), userInfo: nil, repeats: false)
        
    }
    
    @objc func loadNextQuestion() {
        for button in answerButtonArray {
            button.backgroundColor = UIColor.white
        }
        if (currentIndex < maxQuestions) {
            
            enableButtons()
            setQuestion()
        }
        else {
            performSegue(withIdentifier: "endOfQuizSegue", sender: nil)
        }
        
    }
    
    func setQuestion() {
        currentQuestion = dataBase.questions[currentIndex]
        if let currentQuestion = currentQuestion {
            labelQuestion.text = currentQuestion.question
            answer0.setTitle(currentQuestion.answers[0], for: .normal)
            answer1.setTitle(currentQuestion.answers[1], for: .normal)
            answer2.setTitle(currentQuestion.answers[2], for: .normal)
            answer3.setTitle(currentQuestion.answers[3], for: .normal)
        }
        
        currentIndex += 1
        lblProgress.text = "\(currentIndex) / \(dataBase.count)"
    }    
    
    override func prepare(for segue:
        UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "endOfQuizSegue")
        {
            let vc = segue.destination as!
            ResultsViewController
            vc.VCDel = self
            vc.noCorrect = noCorrect
            vc.total = dataBase.count
            
        }
    }
    
}

struct Question {
    
    let question: String
    let answers: [String]
    let correctAnswerIndex: Int
    
    init(question: String, answers: [String], correctAnswerIndex: Int){
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
    }
    
}


