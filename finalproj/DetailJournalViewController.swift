import UIKit

class DetailJournalViewController: UIViewController {
    
    @IBOutlet var setDate: UILabel!
    @IBOutlet var setEntry: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setDate.text = date[intask]
        setEntry.text = journal[intask]
    }
}
