//
//  UDSettings.swift
//  SampleMVVM
//
//  Created by Jignesh gangajaliya on 12/11/19.
//

import Foundation
import UIKit

class UDSettings {
    
    /// This will store the value of Username in the userDefault.
    ///
    /// To SET the values
    ///
    ///     UDSettings.username = "Jignesh"
    ///
    ///
    /// To GET the values
    ///
    ///     print(UDSettings.username)
    ///
    class var username: String {
        get {
            return UserDefaults.standard[#function] ?? ""
        }
        set {
            UserDefaults.standard[#function] = newValue
        }
    }
}

extension UserDefaults {
    
    subscript<T>(key: String) -> T? {
        get {
            return value(forKey: key) as? T
        }
        set {
            set(newValue, forKey: key)
        }
    }
    
    subscript<T: RawRepresentable>(key: String) -> T? {
        get {
            if let rawValue = value(forKey: key) as? T.RawValue {
                return T(rawValue: rawValue)
            }
            return nil
        }
        set {
            set(newValue?.rawValue, forKey: key)
        }
    }
}


