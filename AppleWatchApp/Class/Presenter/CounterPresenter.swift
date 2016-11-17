import UIKit




/// This presenter manages the display of a counter.
class CounterPresenter: UIViewController
{
    // MARK: Attributes
    
    private var count: Int = 10 {
        didSet {
            counter.text = String(count)
            steeper.value = Double(count)
        }
    }
    
    @IBOutlet weak var counter: UILabel! {
        didSet { counter.text = String(count) }
    }
    @IBOutlet weak var steeper: UIStepper! {
        didSet { steeper.value = Double(count) }
    }
    
    
    
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationsManager.subscribeToStatusChanges(object: self, selector: #selector(statusChanged))
    }
    
    
    func statusChanged(notification: NSNotification) {
        guard let count = notification.object as? CountType
            else { return }
        self.count = count
    }
    
    
    
    
    // MARK: Events
    
    @IBAction func steeperValueChanged(_ sender: UIStepper) {
        self.count = Int(sender.value)
    }
    
}
