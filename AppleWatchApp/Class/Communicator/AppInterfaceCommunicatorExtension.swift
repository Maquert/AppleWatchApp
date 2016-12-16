import Foundation
import WatchConnectivity



/// Interferes between Communicator and the rest of the app.
extension WatchInterfaceCommunicator
{
    func postAppRequestNotification(message: CommunicatorMessage) {
        guard let countValue = message[PayloadKeys.Counter.key] as? CountType else {
            return
        }
        NotificationsManager.postStatus(status: countValue)
    }
}

extension WatchInterfaceCommunicator
{
    @available(iOS 9.3, *)
    public func sessionDidBecomeInactive(_ session: WCSession) {
        print("WatchInterfaceCommunicator >> iPhone connection did become active")
    }
    
    @available(iOS 9.3, *)
    public func sessionDidDeactivate(_ session: WCSession) {
        print("WatchInterfaceCommunicator >> iPhone connection was deactivated")
    }
}
