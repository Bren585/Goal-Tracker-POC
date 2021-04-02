//
//  RewardDisplay.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 4/1/21.
//

import UIKit

class RewardDisplay : UIView {
    var userData : UserDefaults = .standard
    
    var rewards = [0, 0, 0, 0, 0]
    
    @IBOutlet weak var cat1 : UILabel?;
    @IBOutlet weak var cat2 : UILabel?;
    @IBOutlet weak var cat3 : UILabel?;
    @IBOutlet weak var cat4 : UILabel?;
    @IBOutlet weak var cat5 : UILabel?;
    
    
    public func Load() {
        let hold = userData.array(forKey: "rewards")
        if let unwrap = hold as? [Int] {rewards = unwrap}
        else                           {rewards = [0, 0, 0, 0, 0]}
        Refresh()
    }
    
    public func Save() {
        userData.set(rewards, forKey: "rewards")
    }
    
    public func Refresh() {
        for i in 0...4 {
            [cat1, cat2, cat3, cat4, cat5][i]?.text = "\(rewards[i])"
        }
    }
    
    public func Reward(category: Int, value : Int) {
        rewards[category] += value
        Save()
        Refresh()
    }
}
