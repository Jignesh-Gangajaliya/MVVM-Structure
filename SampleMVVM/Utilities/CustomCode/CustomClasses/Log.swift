//
//  Log.swift
//  SampleMVVM
//
//  Created by Jignesh gangajaliya on 12/11/19.
//

public struct Log {
    
    /// This method will print the console log.
    ///
    /// - Parameter data: Data which you wanted to Print.
    static func console(_ data: Any) {
        #if DEBUG
        print(data)
        #endif
    }
    
}
