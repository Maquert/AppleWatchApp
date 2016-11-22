import WatchConnectivity
import Foundation





/// Handles incoming and outcoming data between watchOS and iOS
/// Disclaimer: All transfers are async!
class WatchInterfaceCommunicator: NSObject, WCSessionDelegate
{
    // MARK: Attributes
    var session: WCSession!
    typealias CommunicatorMessage = [String : Any]
    
    
    
    
    // MARK: Init
    
    override init() {
        super.init()
        
        if WCSession.isSupported() {
            self.session = WCSession.default()
            self.session.delegate = self
            self.session.activate()
            print("WatchInterfaceCommunicator >> Watch connection started with App counterpart.")
        }
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("WatchInterfaceCommunicator >> Communication established.")
    }
    
    
    
    
    // MARK: Communication
    
    func updateAppContext(info: CommunicatorMessage) {
        do {
            try self.session.updateApplicationContext(info)
            print("WatchInterfaceCommunicator >> Sending App Context: \(info).")
        }
        catch WatchConnectivity.WCError.notReachable {
            print("WatchInterfaceCommunicator >> Error: Phone could not connect to its counterpart.")
        }
        catch {
            print("WatchInterfaceCommunicator >> Generic error: \(error).")
        }
    }
    
    
    
    
    // MARK: Delegate
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("WatchInterfaceCommunicator >> Received app message \(message)")
        postAppRequestNotification(message: message)
    }
}
