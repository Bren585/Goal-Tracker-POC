//
//  EntryCreator.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/18/21.
//

import UIKit

class EntryCreator : UIViewController {
    
    @IBOutlet weak var goalName : UITextField!
    @IBOutlet weak var goalType : UIPickerView!
    @IBOutlet weak var goalValue: UISlider!
    var pickerData              = PickerDataHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad();
        goalType.dataSource = pickerData
        goalType.delegate   = pickerData
    }
    
    func createEntry(_ goalArray: GoalArray) -> Entry
    {
        let name    = goalName.text
        let type    = goalType.selectedRow(inComponent: 0)
        let value   = Int(goalValue.value)
        
        return Entry(goalArray, text: name ?? "", category: type, reward: value)
    }
    
}
