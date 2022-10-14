//
// Created for AppReview-iOS 16
// by Stewart Lynch on 2022-10-13
// Using Swift 5.0
//
// Follow me on Twitter: @StewartLynch
// Subscribe on YouTube: https://youTube.com/StewartLynch
//

import SwiftUI

enum AppReviewRequest {
    static let threshold = 3
    @AppStorage("runsSinceLastRequest") static var runsSinceLastRequest = 0
    @AppStorage("storedVersion") static var storedVersion = ""
    
    static func appURL(id: String) -> URL? {
        guard let writeReviewURL = URL(string: "https://apps.apple.com/app/id\(id)?action=write-review") else {
            print("Invalid URL")
            return nil
        }
        return writeReviewURL
    }
    
    static var showReviewButton: Bool {
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        return appVersion == storedVersion
    }
    
    static var requestReview: Bool {
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        runsSinceLastRequest += 1
        print("Run Count: \(runsSinceLastRequest)")
        print("App Version: \(appVersion)")
        print("Stored Version: \(storedVersion)")
        
        guard storedVersion != appVersion else {
            print("There has been no update since the last request")
            runsSinceLastRequest = 0
            return false
        }
        
        if runsSinceLastRequest >= threshold {
            print("Threshold reached so make request for this version")
            storedVersion = appVersion
            runsSinceLastRequest = 0
            return true
        }
        
        print("Waiting to reach threshold before making request")
        return false
    }
}
