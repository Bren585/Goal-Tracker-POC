//
//  Picker.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/18/21.
//

import Foundation
import UIKit

class PickerDataHelper: NSObject, UIPickerViewDataSource {
    public var data: [String] = ["Mind", "Body", "Soul", "Work", "Play"]
    
    @discardableResult init (_ picker: UIPickerView) {
        super.init()
        picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
