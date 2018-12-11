import UIKit

class EditJournalViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var editInput: UITextView!
    
    @IBAction func enterPressed(_ sender: Any){
        if(editInput.text != ""){
            journal.remove(at: intask)
            journal.insert(editInput.text!, at: intask)
            date.remove(at: intask)
            let dates = DateFormatter()
            dates.dateFormat = "MMM dd, YYYY"
            date.insert(dates.string(from: myDatePicker.date), at: intask)
            editInput.text = ""
            UserDefaults.standard.set(date, forKey: "setDate")
            UserDefaults.standard.set(journal, forKey: "setEntry")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editInput.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        editInput.resignFirstResponder()
        return true
    }
    
}
