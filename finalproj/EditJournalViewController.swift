import UIKit

class EditJournalViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var getDate: UILabel!
    @IBOutlet var editInput: UITextView!
    
    @IBAction func enterPressed(_ sender: Any){
        if(editInput.text != ""){
            journal.remove(at: intask)
            journal.insert(editInput.text!, at: intask)
            editInput.text = ""
            UserDefaults.standard.set(journal, forKey: "setEntry")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDate.text = date[intask]
        editInput.text = journal[intask]
        
        editInput.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editInput.resignFirstResponder()
        return true
    }
    
}
