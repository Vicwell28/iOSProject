//
//  Data.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 24/08/22.
//

import Foundation
import UIKit

class DataSingleton : NSObject {
    
    private override init() { }
    
    static let shared : DataSingleton = DataSingleton()
    
    var token : String = String()
    
}
