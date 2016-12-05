import WatchKit




class ExtensionDelegate: NSObject, WKExtensionDelegate {

    // MARK: Attributes
    let watchInterfaceCommunicator = WatchInterfaceCommunicator()
    
    
    
    
    func applicationDidFinishLaunching() {
        NotificationsManager.subscribeToCounterPartRequests(object: self, selector: #selector(counterUpdated))
        
    }
    
    
    // Notifications
    func counterUpdated(notification: NSNotification) {
        guard let count = notification.object as? CountType
            else { return }
        
        let info: CounterDictType = PayloadKeys.Counter.dictionary(count: count)
        watchInterfaceCommunicator.updateAppContext(info: info)
    }
    
    

    
    // Background tasks
    
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        // Sent when the system needs to launch the application in the background to process tasks. Tasks arrive in a set, so loop through and process each one.
        for task in backgroundTasks {
            // Use a switch statement to check the task type
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                // Be sure to complete the background task once you’re done.
                backgroundTask.setTaskCompleted()
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                // Snapshot tasks have a unique completion call, make sure to set your expiration date
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                // Be sure to complete the connectivity task once you’re done.
                connectivityTask.setTaskCompleted()
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                // Be sure to complete the URL session task once you’re done.
                urlSessionTask.setTaskCompleted()
            default:
                // make sure to complete unhandled task types
                task.setTaskCompleted()
            }
        }
    }

}
