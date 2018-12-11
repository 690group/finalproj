import UIKit

class DetailJournalViewController: UIViewController {
    
    @IBOutlet var setDate: UILabel!
    @IBOutlet var setEntry: UITextView!
    
    var DateText = String()
    var EntryText = String()
    
    override func viewDidLoad() {
        setDate.text = DateText
        setEntry.text = EntryText
    }
}
