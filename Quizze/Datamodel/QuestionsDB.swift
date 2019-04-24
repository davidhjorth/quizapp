//
//  QuestionsDB.swift
//  Quizze
//
//  Created by Adam Lang & David Hjorth on 2019-03-13.
//  Copyright © 2019 Adam Lang. All rights reserved.
//

import Foundation

class QuestionsDB{
     var questions = [Question]()
    
    func get(index: Int) -> Question?{
        if index >= 0 && index <= questions.count {
            return questions[index]
        }
        return nil
        
    }
    
    func set(question: Question){
        questions.append(question)
    }
    var count: Int {
        return questions.count
        
    }
    func Startup() {
        
        questions.append(Question(question: "What does SMS stand for?" , answers: [" Text Message", " Simple Message Sender", " Short Message Service", " Sound Message Sender"], correctAnswerIndex: 2))
        
         questions.append(Question(question: "What is the name of the network of computers from which the Internet has emerged?" , answers: [" Giganet", " OpenNet", " NSFNET", " Arpanet"], correctAnswerIndex: 3))
        
         questions.append(Question(question: "What used to be the currency of Italy?" , answers: [" Peso", " Lira", " Rupie", " Rubel"], correctAnswerIndex: 1))
        
        questions.append(Question(question: "What is the main component in glass?" , answers: [" Sand", " Quartz", " Carbon", " Lime"], correctAnswerIndex: 0))
        
        questions.append(Question(question: "In which state was Bill Clinton governor before becoming President of the United States?" , answers: [" Texas", " Alabama", " Illinois", " Arkansas"], correctAnswerIndex: 3))

        questions.append(Question(question: "In which city was the Titanic built?" , answers: [" London", " Belfast", " Liverpool", " Southampton"], correctAnswerIndex: 1))

        questions.append(Question(question: "What is the most spoken language in the world?" , answers: [" English", " Chinese", " Spanish", " Arabic"], correctAnswerIndex: 1))

        questions.append(Question(question: "After which animals are the Canary Islands named?" , answers: [" Dogs", " Birds", " Cats", " Horses"], correctAnswerIndex: 0))

        questions.append(Question(question: "Who painted the ceiling of the Sistine Chapel?" , answers: [" Picasso", " Leonardo Da Vinci", " Michaelangelo", " Julius Ceasar"], correctAnswerIndex: 2))

        questions.append(Question(question: "What is the capital of Australia?" , answers: [" Sydney", " Canberra", " Melbourne", " Adelaide"], correctAnswerIndex: 1))

        questions.append(Question(question: "How many time zones are there in the world?" , answers: [" 24", " 12", " 16", " 20"], correctAnswerIndex: 0))

        questions.append(Question(question: "What is the largest city in Canada?" , answers: [" Montreal", " Toronto", " Calgary", " Winnipeg"], correctAnswerIndex: 1))

        questions.append(Question(question: "What color is cobalt?" , answers: [" Grey", " Black", " White", " Blue"], correctAnswerIndex: 3))

        questions.append(Question(question: "Who was the first president of the USA?" , answers: [" Abraham Lincoln", " George Washington", " John Adams", " Thomas Jefferson"], correctAnswerIndex: 1))

        questions.append(Question(question: "In what year was Google launched on the web?" , answers: [" 1988", " 1995", " 1998", " 2000"], correctAnswerIndex: 2))

        questions.append(Question(question: "Which ocean surrounds the Maldives?" , answers: [" The Baltic Ocean", "The Atlantic Ocean", " The Pacific Ocean", " The Indian Ocean"], correctAnswerIndex: 3))

        questions.append(Question(question: "Which element is diamond made out of?" , answers: [" Stone", " Crystal", " Aquamarine", " Carbon"], correctAnswerIndex: 3))

        questions.append(Question(question: "What company invented the three-point seat belt?" , answers: [" BMW", " Ford", " Tesla", " Volvo"], correctAnswerIndex: 3))

        questions.append(Question(question: "What did the crocodile in Peter pan swallow?" , answers: [" Tinkerbell", " A clock", " A bow and arrow", " A treasure map"], correctAnswerIndex: 1))

        questions.append(Question(question: "How many dots are there on two dice" , answers: [" 42", " 38", " 50", " 46"], correctAnswerIndex: 0))

        questions.append(Question(question: "What disease is the main focus of oncology?" , answers: [" Bone disease", " Diabetes", " Parkinson's", " Cancer"], correctAnswerIndex: 3))

        questions.append(Question(question: "What falling fruit supposedly inspired Isaac Newton to write the laws of gravity?" , answers: [" A banana", " A pear", " An apple", " A cherry"], correctAnswerIndex: 2))

        questions.append(Question(question: "How old is the Earth?" , answers: [" 450 thousand years old", " 4.5 milion years old", " 4.5 thousand years old", " 4.5 billion years old"], correctAnswerIndex: 3))

        questions.append(Question(question: "Which Danny starred in Batman Returns?" , answers: [" Pierce", " De Vito", " Saucedo", " Moses"], correctAnswerIndex: 1))

        questions.append(Question(question: "What is the worlds longest river?" , answers: [" The Amazon", " The Nile", " The Mississippi", " The Niagara"], correctAnswerIndex: 1))

        questions.append(Question(question: "What is the name of the Smurf's evil nemesis?" , answers: [" Krang", " Gargamel", " Alcazar", " The Duke"], correctAnswerIndex: 1))

        questions.append(Question(question: "What is the worlds biggest island?" , answers: [" Japan", " Ireland", " Greenland", " Iceland"], correctAnswerIndex: 2))

        questions.append(Question(question: "What does the letter N stand for in NATO?" , answers: [" Neutral", " National", " North", " Nuclear"], correctAnswerIndex: 2))

        questions.append(Question(question: "Which country has not fought a war since 1814?" , answers: [" Japan", " Sweden", " Germany", " China"], correctAnswerIndex: 1))

        questions.append(Question(question: "In Norse Mythology, where is the home of the gods, reached by crossing the rainbow bridge?" , answers: [" Olympys", " Heaven", " Hell", " Asgard"], correctAnswerIndex: 3))
        
    }
    //Initizalizer for Questions Database
    init(){
        Startup()
    }
    
}
