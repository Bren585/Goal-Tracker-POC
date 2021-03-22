//
//  ViewArray.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/15/21.
//

import Foundation
import UIKit

public class GoalArray {
    var canvas : UIView
    var views  : [Int : Entry] = [:]
    
    public func Add(text: String?, id: Int? = nil) {
        let newEntry = Entry(self, y: 6 + (views.count * 26), text: text ?? "")
        let new_id = id ?? views.count
        newEntry.id = new_id
        views[new_id] = newEntry
    }
    
    public func AddSubview(_ UIObject: UIView?) {if let unwrap = UIObject {canvas.addSubview(unwrap)}}
    
    @discardableResult public func Remove(id: Int?) -> Bool {
        if let view = views[id ?? -1] {view.RemoveFromSuperview(); return true}
        return false
    }
    
    public func RemoveSubview(id: Int) {views.removeValue(forKey: id)}
    
    public func Reward(category: Int, reward: Int) {
        
    }
    
    init(canvas : UIView = UIView()) {
        self.canvas = canvas
    }
}
