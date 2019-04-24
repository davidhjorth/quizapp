//
//  HighScoreTableCell.swift
//  Quizze
//
//  Created by Adam Lang & David Hjorth  on 2019-04-16.
//  Copyright © 2019 Adam Lang. All rights reserved.
//

import UIKit

class HighScoreTableCell: UITableViewCell {
    
    // SHOWS LABEL POSITION IN HIGHSCORE TABLEVIEW
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    func showPoints(points: Int, position: Int) {
        scoreLabel.text = String(points)
        positionLabel.text = String(position)
        
    }
    
}
