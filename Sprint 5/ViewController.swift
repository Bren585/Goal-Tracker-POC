//
//  ViewController.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/11/21.
//

import UIKit

class ViewController: UIViewController {

    var viewPile  = ViewPile()
    
    @IBOutlet weak var MessageView  : UIView!
    @IBOutlet weak var Welcome      : UILabel!
    @IBOutlet weak var Countdown    : UILabel!
    @IBOutlet weak var GoalList     : GoalView!
    
    @IBOutlet weak var ButtonView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewPile.Add(name: "message", view : MessageView)
        viewPile.Add(name: "button",  view : ButtonView)
        viewPile.See(name: "button")
    }
    
    @IBAction func ButtonPressed(_ sender: Any) {
        viewPile.See(name: "message")
    }
    
    @IBAction func Unwind(unwindSeque: UIStoryboardSegue) {
        let source = unwindSeque.source as! EntryCreator
        GoalList!.goalArray!.AddEntry(source.createEntry(GoalList!.goalArray!))
    }
    
    
}

