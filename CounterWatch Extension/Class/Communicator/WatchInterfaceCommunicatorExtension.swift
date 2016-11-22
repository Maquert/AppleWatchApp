import Foundation



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
