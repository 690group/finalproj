import UIKit

var date = [String] ()
var journal = [String] ()
var intask = 0

class JournalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let x = UserDefaults.standard.object(forKey: "setDate") {date = x as! [String]}
        if let x = UserDefaults.standard.object(forKey: "setEntry") {journal = x as! [String]}
        return date.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell")!
        cell.textLabel?.text = date[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            date.remove(at: indexPath.row)
            UserDefaults.standard.set(date, forKey: "setDate")
            UserDefaults.standard.set(journal, forKey: "setEntry")
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        intask = indexPath.row
        performSegue(withIdentifier: "switch", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}
