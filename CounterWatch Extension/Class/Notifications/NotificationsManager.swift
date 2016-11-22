import Foundation




/// This class centralizes notifications between watchOS and iOS
class NotificationsManager
{
    // MARK: Status
    static func subscribeToStatusChanges(object: Any, selector: Selector) {
        NotificationCenter.default.addObserver(object, selector: selector, name: .NotificationKeyReceivedAppContext, object: nil)
    }
    
    static func postStatus(status: CountType) {
        let notification = Notification(name: .NotificationKeyReceivedAppContext, object: status)
        NotificationCenter.default.post(notification as Notification)
    }
}
