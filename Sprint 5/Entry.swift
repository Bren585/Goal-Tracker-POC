//
//  GoalEntry.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/18/21.
//

import Foundation
import UIKit

public class Button {
    var         title       = "error"
    var         constant    = 0
    var         parent      : Entry
    var         frame       = CGRect()
    var         action      = UIAction(title: "pressed") {(none) in print("Button Pressed")}
    public var  UIObject    = UIButton()
    
    func createButton() -> UIButton
    {
        UIObject = UIButton(type: .custom, primaryAction: action)
        UIObject.setTitle(title, for: .normal)
        UIObject.setTitleColor(.black, for: .normal)
        return UIObject
    }
    
    init(_ parent: Entry) {
        self.parent     = parent
    }
}

public class RemoveButton : Button {
    override init(_ parent: Entry)
    {
        super.init(parent)
        action = UIAction(title: "pressed") {(none) in
            print("XButton Pressed")
            self.parent.RemoveFromSuperview()
        }
        title    = "X"
        constant = -41
    }
}

public class RewardButton : Button {
    var category : Int
    var reward   : Int
    init(_ parent: Entry, category: Int = 0, reward: Int = 0)
    {
        self.category   = category
        self.reward     = reward
        super.init(parent)
        action = UIAction(title: "pressed") {(none) in
            print("RButton Pressed")
            self.parent.parent?.Reward(category: category, reward: reward)
        }
        title    = "[ ]"
        constant = -10
    }
}

public class Entry: Equatable {
    public var id           = 0
    public var rewardButton : RewardButton?
    public var removeButton : RemoveButton?
    public var label        : UILabel?
    public var parent       : GoalArray?
    public var category     : Int
    public var reward       : Int
    
    public static func ==(here: Entry, there: Entry) -> Bool {
        return here.ToHash() == there.ToHash()
    }
    
    public func ToHash() -> String {
        return "\(label!.text ?? "")\(category)\(reward)"
    }

    init(fromHash: String) {
        var hash = fromHash
        let char_reward   = hash.popLast()
        let char_category = hash.popLast()
        
        label = UILabel()
        label?.text = hash
        category = Int(String(char_category!))!
        reward   = Int(String(char_reward!))!
        
        removeButton = RemoveButton(self)
        rewardButton = RewardButton(self, category: category, reward: reward)
    }
    
    init(_ parent: GoalArray, text: String, category: Int, reward: Int)
    {
        self.parent   = parent
        self.category = category
        self.reward   = reward
        //Label
        label = UILabel()
        label?.text = text
        
        // Remove Button
        removeButton = RemoveButton(self)
        
        // Reward Button
        rewardButton = RewardButton(self, category: category, reward: reward)
    }
    
    func Destroy(_ UIObject: UIView?)
    {
        if let unwrap = UIObject {unwrap.removeFromSuperview()}
    }
    
    func RemoveFromSuperview() {
        Destroy(rewardButton!.UIObject)
        Destroy(removeButton!.UIObject)
        Destroy(label)
        parent?.RemoveSubview(id: id)
        print("Entry Removed")
    }
    
    func PlaceButtons()
    {
        for button in [removeButton, rewardButton]
        {
            button?.UIObject.frame = CGRect(x: ((label?.superview?.frame.maxX)!
                                                + CGFloat(button!.constant) - 31), //width + 10
                                            y: (label?.frame.minY)!,
                                            width: 21,
                                            height: 21)
        }
    }
    
    func Place(atY: Int = -1)
    {
        var y: Int
        if atY == -1 {y = 6 + (id * 26)}
        else         {y = 6 + (atY * 26)}
        
        label?.frame =          CGRect(x: 10,  y: y, width:200, height: 21)
        removeButton?.frame =   CGRect(x: 200, y: y, width: 21, height: 21)
        rewardButton?.frame =   CGRect(x: 251, y: y, width: 21, height: 21)
        
        self.parent?.AddSubview(label!)
        self.parent?.AddSubview((removeButton?.createButton())!)
        self.parent?.AddSubview((rewardButton?.createButton())!)
        PlaceButtons()
    }
    
    func Replace(atY: Int = -1)
    {
        var y: Int
        if atY == -1 {y = 6 + (id  * 26)}
        else         {y = 6 + (atY * 26)}
        
        label?.frame =                 CGRect(x: 10,  y: y, width:200, height: 21)
        PlaceButtons()
    }
}
