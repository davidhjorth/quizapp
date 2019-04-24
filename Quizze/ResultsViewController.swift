//
//  ResultsViewController.swift
//  Quizze
//
//  Created by Adam Lang & David Hjorth  on 2019-03-08.
//  Copyright © 2019 Adam Lang. All rights reserved.
//

import UIKit
import CoreData
protocol VCDelegate {
    func stopSound()
}

class ResultsViewController: UIViewController {
    
    var VCDel: VCDelegate?
    
    var failPepe = UIImageView()
    var sweatyPepe = UIImageView()
    var noCorrect = 0
    var total = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let trans = CGAffineTransform(scaleX: 0.1, y: 0.1)
        lblResults.transform = trans
        lblResults.text = "You got \(noCorrect) out of \(total) correct"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let saveScore = Quizzie(context: appDelegate.persistentContainer.viewContext)
            saveScore.highScore = Int16(noCorrect)
            appDelegate.saveContext()
        }
        
        // ANIMATION FUNCTIONS
        var late = 0.0
        UIView.animate(withDuration: 1, delay: late, options: [], animations: {
            self.lblResults.transform = .identity
        })
        late += 0.2
        
        //CALCULATES % CORRECT
        var percentCorrect = Double(noCorrect) / Double(total)
        percentCorrect *= 100
        
        if(percentCorrect < 40) {
            failMeme.isHidden = false
            sweatyMeme.isHidden = true
            let transMeme = CGAffineTransform(translationX: 200, y: 0)
            UIView.animate(withDuration: 1.5, animations: {
                self.failMeme.transform = transMeme
                
            })
        } else if (percentCorrect >= 70) {
            failMeme.isHidden = true
            sweatyMeme.isHidden = false
            let transMeme = CGAffineTransform(translationX: 200, y: 0)
            UIView.animate(withDuration: 1.5, animations: {
                
                self.sweatyMeme.transform = transMeme
                
            })
        }
    }
    
    @IBOutlet weak var lblResults: UILabel!
    @IBAction func exitButton(_ sender: UIButton) {
        
        UIControl().sendAction(#selector(NSXPCConnection.suspend),
                               to: UIApplication.shared, for: nil)
    }
    
    
    @IBOutlet weak var failMeme: UIImageView!
    @IBOutlet weak var sweatyMeme: UIImageView!
    
    @IBAction func restartBtn(_ sender: Any) {
        VCDel?.stopSound()
        performSegue(withIdentifier: "restartSegue", sender: self)
    }
}
