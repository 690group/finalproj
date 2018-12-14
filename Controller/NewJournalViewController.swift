import UIKit

class NewJournalViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBOutlet var input: UITextView!
    
    @IBAction func enterPressed(_ sender: Any){
        if(input.text != ""){
            journal.insert(input.text!, at: 0)
            let dates = DateFormatter()
            dates.dateFormat = "MMMM dd, YYYY"
            date.insert(dates.string(from: myDatePicker.date), at: 0)
            input.text = ""
            UserDefaults.standard.set(date, forKey: "setDate")
            UserDefaults.standard.set(journal, forKey: "setEntry")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        input.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }
}
