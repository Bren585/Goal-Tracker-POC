//
//  ViewArray.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/15/21.
//

import UIKit

public class GoalArray {
    var canvas   : UIView
    var entries  : [Entry] = []
    var rewarder : RewardDisplay?
    var userData : UserDefaults = .standard
    public var category : Int
    
    init(canvas: UIView = UIView(), category: Int = -1) {
        self.canvas = canvas
        self.category = category
        for subview in canvas.superview?.subviews ?? [] {
            if let rewardDisplay = subview as? RewardDisplay {
                rewarder = rewardDisplay
                break
            }
        }
        Load()
    }
    
    public func Load()
    {
        let hold = userData.array(forKey: "entries")
        if  hold != nil {
            for hash in hold as! [String] {
                let newEntry = Entry(fromHash: hash)
                if newEntry.category == category || category == -1 {AddEntry(newEntry)}
            }
        }
        else {userData.set([String](), forKey: "entries")}
        LoadArray()
    }
    
    func Save(_ reference: Entry) {
        let entry = Entry(fromHash: reference.ToHash())
        var archive = userData.array(forKey: "entries") as! [String]
        if !archive.contains(entry.ToHash()) {
            entry.id = -1
            archive.append(entry.ToHash())
        }
        userData.set(archive, forKey: "entries")
    }
    
    public func Add(text: String?) {
        AddEntry(Entry(self, text: text ?? "", category: 0, reward: 0))
    }
    
    public func AddEntry(_ newEntry: Entry!)
    {
        let index = entries.count
        newEntry.id     = index
        newEntry.parent = self
        newEntry.Place()
        entries.append(newEntry)
        Save(newEntry)
    }
    
    public func AddSubview(_ view: UIView?)
    {
        if let wrap = view {canvas.addSubview(wrap)}
    }
    
    @discardableResult public func Remove(id: Int!) -> Bool {
        if id < entries.count {entries[id].RemoveFromSuperview(); return true}
        return false
    }
    
    public func RemoveSubview(id: Int) {
        if id >= entries.count {return}
        var hold = userData.array(forKey: "entries") as! [String]
        hold.removeAll(where: {$0 == entries[id].ToHash()})
        entries.removeAll(where: {$0.id == id})
        userData.set(hold, forKey: "entries")
        Refresh()
    }
    
    func LoadArray() {
        if entries.count == 0 {return}
        for i in 0...(entries.count - 1) {
            entries[i].parent = self
            entries[i].id = i
        }
    }
    
    public func Fresh() {
        if entries.count == 0 {return}
        for i in 0...(entries.count - 1) {
            entries[i].Place(atY: i)
        }
    }
    
    public func Refresh() {
        if entries.count == 0 {return}
        for i in 0...(entries.count - 1) {
            entries[i].id = i
            entries[i].Replace(atY: i)
        }
    }
    
    public func Reward(category: Int, reward: Int) {
        rewarder?.Reward(category: category, value: reward)
    }
}
