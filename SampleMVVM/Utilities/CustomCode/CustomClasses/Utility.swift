//
//  Utility.swift
//  SampleMVVM
//
//  Created by Jignesh gangajaliya on 12/11/19.
//

import Foundation
import UIKit

/// Utility class for application
public struct Utility {
    
    /// App's name (if applicable).
    public static var appDisplayName: String? {
        // http://stackoverflow.com/questions/28254377/get-app-name-in-swift
        return Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String
    }
    
    /// This will return a App Vendor UUID
    public static var appVendorUUID: String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }
    
    /// App's bundle ID (if applicable).
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }
    
    /// App current build number (if applicable).
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }
    
    /// App's current version (if applicable).
    public static var appVersion: String? {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Screen height.
    public static var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// Screen width.
    public static var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Check if app is running in debug mode.
    public static var isInDebuggingMode: Bool {
        // http://stackoverflow.com/questions/9063100/xcode-ios-how-to-determine-whether-code-is-running-in-debug-release-build
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    /// Current status bar network activity indicator state.
    public static var isNetworkActivityIndicatorVisible: Bool {
        get {
            return UIApplication.shared.isNetworkActivityIndicatorVisible
        }
        set {
            UIApplication.shared.isNetworkActivityIndicatorVisible = newValue
        }
    }
    
    
    /// Check if application is running on simulator (read-only).
    public static var isRunningOnSimulator: Bool {
        // http://stackoverflow.com/questions/24869481/detect-if-app-is-being-built-for-device-or-simulator-in-swift
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    ///  Most top view controller (if applicable).
    public static var mostTopViewController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }
        set {
            UIApplication.shared.keyWindow?.rootViewController = newValue
        }
    }
    
    /// This method will return a Top Most View Controller (currectly visible) of the application's window which you can use.
    ///
    /// - Returns: Object of the UIViewController
    public func topMostController() -> UIViewController? {
        var from = UIApplication.shared.keyWindow?.rootViewController
        while (from != nil) {
            if let to = (from as? UITabBarController)?.selectedViewController {
                from = to
            } else if let to = (from as? UINavigationController)?.visibleViewController {
                from = to
            } else if let to = from?.presentedViewController {
                from = to
            } else {
                break
            }
        }
        return from
        
    }
    
    /// Class name of object as string.
    ///
    /// - Parameter object: Any object to find its class name.
    /// - Returns: Class name for given object.
    static func typeName(for object: Any) -> String {
        let objectType = type(of: object.self)
        return String.init(describing: objectType)
    }
}
