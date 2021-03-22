//
//  GoalEntry.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/18/21.
//

import Foundation
import UIKit

public class Button {
    var         parent      : Entry
    var         frame       : CGRect
    var         action      = UIAction(title: "pressed") {(none) in print("Button Pressed")}
    public var  UIObject    = UIButton()
    
    func createButton() -> UIButton
    {
        return UIButton(frame: frame, primaryAction: action)
    }
    
    init(_ parent: Entry, id: Int?, frame: CGRect) {
        self.parent     = parent
        self.frame      = frame
    }
}

public class RemoveButton : Button {
    override init(_ parent: Entry, id: Int?, frame: CGRect)
    {
        super.init(parent, id: id, frame: frame)
        action = UIAction(title: "pressed") {(none) in
            print("XButton Pressed")
            self.parent.RemoveFromSuperview()
        }
        self.UIObject = createButton()
    }
}

public class RewardButton : Button {
    var category : Int
    var reward   : Int
    init(_ parent: Entry, id: Int?, frame: CGRect, category: Int = 0, reward: Int = 0)
    {
        self.category   = category
        self.reward     = reward
        super.init(parent, id: id, frame: frame)
        action = UIAction(title: "pressed") {(none) in
            print("RButton Pressed")
            self.parent.parent.Reward(category: category, reward: reward)
        }
        self.UIObject   = createButton()
    }
}

public class Entry {
    public var id           = 0
    public var rewardButton : RewardButton?
    public var removeButton : RemoveButton?
    public var label        : UILabel?
    public var parent       : GoalArray
    
    func Destroy(_ UIObject: UIView?)
    {
        if let unwrap = UIObject {unwrap.removeFromSuperview()}
    }
    
    func RemoveFromSuperview() {
        Destroy(rewardButton!.UIObject)
        Destroy(removeButton!.UIObject)
        Destroy(label)
        parent.RemoveSubview(id: id)
        print("Entry Removed")
    }
    
    init(_ parent: GoalArray, y: Int, text: String, category: Int, reward: Int)
    {
        self.parent = parent
        //Label
        label = UILabel(frame:CGRect(x: 10, y: y,  width:200, height: 21))
        label?.text = text
        self.parent.AddSubview(label)
        
        // Remove Button
        removeButton = RemoveButton(self, id:id, frame: CGRect(x: 200, y: y, width: 21, height: 21))
        removeButton?.UIObject.setTitle("X", for: .normal)
        removeButton?.UIObject.setTitleColor(.black, for: .normal)
        self.parent.AddSubview(removeButton?.UIObject)
        
        // Reward Button
        rewardButton = RewardButton(self, id:id, frame: CGRect(x: 251, y: y, width: 21, height: 21))
        rewardButton?.UIObject.setTitle("[ ]", for: .normal)
        rewardButton?.UIObject.setTitleColor(.black, for: .normal)
        rewardButton?.category  = category
        rewardButton?.reward    = reward
        self.parent.AddSubview(rewardButton?.UIObject)
    }
}
