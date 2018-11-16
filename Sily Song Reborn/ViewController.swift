//
//  ViewController.swift
//  Sily Song Reborn
//
//  Created by Rajat Sharma on 11/16/18.
//  Copyright © 2018 Rajat Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    @IBAction func reset(_ sender: AnyObject) {
    nameField.text = ""
    lyricsView.text = ""
    
    }
    
    @IBAction func displayLyrics(_ sender: AnyObject) {
        let originalName : String! = nameField.text
        if originalName.isEmpty{
            lyricsView.text = "Please Enter a Name"
        }
        let lyrics : String = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: originalName)
        
        lyricsView.text = lyrics
    }
}



func shortNameForName(name: String) -> String {
    var lowerName = name.lowercased()
    
    for character in lowerName.characters{
        if character=="a" || character=="e" || character=="i" || character=="o" || character=="u" {
            break
        }else{
            lowerName.remove(at: lowerName.startIndex)
        }
    }
    return lowerName
}



let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")



func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
