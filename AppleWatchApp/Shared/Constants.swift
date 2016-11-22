/**
 *  Constants file.
 *  Using a single file just for clarity sake.
 */

// Notifications
import Foundation

extension Notification.Name {
    static let NotificationKeyReceivedWatchAppContext = Notification.Name("NotificationKeyReceivedWatchAppContext")
    static let NotificationKeyReceivedAppContext = Notification.Name("NotificationKeyReceivedAppContext")
}


// Dictionary Keys
enum PayloadKeys: String {
    case Counter = "CounterKey"
    
    var key: String { return self.rawValue }
}




/**
 *  Common types
 */

typealias CountType = Int
typealias CounterDictType = [String : CountType]
