//
//  HighScoreViewController.swift
//  Quizze
//
//  Created by Adam Lang & David Hjorth  on 2019-04-16.
//  Copyright © 2019 Adam Lang. All rights reserved.
//

import UIKit
import CoreData

class HighScoreViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var highScoreArray: UITableView!
    var resultsArray: [Quizzie] = []
    var fetchResultsController: NSFetchedResultsController<Quizzie>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Quizzie> = Quizzie.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "highScore", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultsController.delegate = self
            
            do {
                try fetchResultsController.performFetch()
                if let fetchedObjects = fetchResultsController.fetchedObjects {
                    resultsArray = fetchedObjects
                }
            }catch {
                print(error)
            }
        }
        
    }
    
    
}

extension HighScoreViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let results = resultsArray[indexPath.row]
        print(results)
        let cell = tableView.dequeueReusableCell(withIdentifier: "highScoreCell") as!
        HighScoreTableCell
        cell.showPoints(points: Int(results.highScore), position: indexPath.row + 1)
        return cell
    }
    
    
}

