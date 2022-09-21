//
//  Checklist.swift
//  Checklists
//
//  Created by Rodrigo Kroef Tarouco on 21/09/22.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
