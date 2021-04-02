//
//  GoalView.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/25/21.
//

import UIKit

class GoalView : UIView {
    public var goalArray : GoalArray?
    var category  = -2
    
    public func hide() {
        isHidden = true;
    }
    
    public func show(category: Int = -1) {
        if self.category == -2 {self.category = category}
        isHidden = false;
        goalArray = GoalArray(canvas: self, category: self.category)
    }
}
