//
//  EntryCreator.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/18/21.
//

import Foundation
import UIKit

class EntryCreator {
    
    var goalName : UITextField!
    var goalType : UIPickerView!
    var goalValue: UISlider!
    
    
    init(textField: UITextField!, picker: UIPickerView!, slider: UISlider!)
    {
        goalName  = textField
        goalType  = picker
        PickerDataHelper(goalType)
        goalValue = slider
    }
    
    func createEntry(_ goalArray: GoalArray, y: Int, frame: CGRect) -> Entry
    {
        let name    = goalName.text
        let type    = goalType.selectedRow(inComponent: 0)
        let value   = Int(goalValue.value)
        
        return Entry(goalArray, y: y, text: name ?? "", category: type, reward: value)
    }
    
}
