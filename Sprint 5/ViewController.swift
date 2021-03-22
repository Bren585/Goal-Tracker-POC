//
//  ViewController.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/11/21.
//

import UIKit

class ViewController: UIViewController {

    var viewPile  = ViewPile()
    var goalArray = GoalArray()
    
    @IBOutlet weak var MessageView  : UIView!
    @IBOutlet weak var Welcome      : UILabel!
    @IBOutlet weak var Countdown    : UILabel!
    @IBOutlet weak var GoalList     : UIView!
    @IBOutlet weak var EntryField   : UITextField!
    
    @IBOutlet weak var ButtonView: UIView!
    
    //                 EntryView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewPile.Add(name: "message", view : MessageView)
        viewPile.Add(name: "button",  view : ButtonView)
        viewPile.See(name: "button")
        goalArray = GoalArray(canvas: GoalList)
    }
    
    @IBAction func EntrySubmit(_ sender: Any) {
        goalArray.Add(text: EntryField.text)
        EntryField.text = ""
    }
    
    @IBAction func ButtonPressed(_ sender: Any) {
        viewPile.See(name: "message")
    }
}

