//
//  ViewPile.swift
//  Sprint 5
//
//  Created by Brendan Koetting on 3/11/21.
//

import Foundation
import UIKit

public class ViewPile
{
    var views : [String : UIView] = [:]
    var scene : String = ""
    
    public func Add(name : String, view : UIView)
    {
        view.isHidden = true
        views[name] = view
    }
    
    public func See(name : String)
    {
        if let old = views[scene] {old.isHidden = true}
        scene = name
        views[scene]!.isHidden = false
    }
    
    init()
    {
    }
}
