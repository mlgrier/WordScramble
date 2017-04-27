//
//  ViewController.swift
//  WordScramble
//
//  Created by Marco Grier on 4/26/17.
//  Copyright © 2017 mlgrier. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Code below took the file and made turned the file into an array
        
        if let startWordsPath = Bundle.main.path(forResource: "start", ofType: "txt") {
            
            if let startWords = try? String(contentsOfFile: startWordsPath) {
                
                allWords = startWords.components(separatedBy: "\n")
                
            } else {
                
                allWords = ["silkworm"]
                
            }
        }
    }
    
    func startGame() {
        
        allWords = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allWords) as! [String]
        title = allWords[0]
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

