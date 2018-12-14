import UIKit
import CoreMotion

class Tracker: UIViewController {
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var stepslbl: UILabel!
    @IBOutlet weak var distlbl: UILabel!
    @IBOutlet weak var calslbl: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    var dist: Double! = nil
    var cals:Double! = nil
    
    var pedometer = CMPedometer()
    let activityManager = CMMotionActivityManager()
    
    let myred = UIColor(red:226/255,green:133/255,blue:133/255,alpha:1)
    let mygreen = UIColor(red:133/255, green:226/255, blue:164/255, alpha:1)
    
    func currentTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        var monthLbl = ""
        
        let day = calendar.component(.day, from: date)
        
        switch month {
        case 1:
            monthLbl = "Jan"
        case 2:
            monthLbl = "Feb"
        case 3:
            monthLbl = "March"
        case 4:
            monthLbl = "April"
        case 5:
            monthLbl = "May"
        case 6:
            monthLbl = "June"
        case 7:
            monthLbl = "July"
        case 8:
            monthLbl = "Aug"
        case 9:
            monthLbl = "Sept"
        case 10:
            monthLbl = "Oct"
        case 11:
            monthLbl = "Nov"
        case 12:
            monthLbl = "Dec"
        default:
            monthLbl = "err"
        }
        
        return "\(monthLbl)/ \(day)/ \(year)"
    }
    
    
    override func viewDidLoad() {
        dateLbl.text = currentTime()
           
        super.viewDidLoad()
        startBtn.layer.cornerRadius = 10
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "Start"{
            sender.setTitle("Stop", for:.normal)
            sender.backgroundColor = myred
            startUpdating()
        } else {
            sender.backgroundColor = mygreen
            sender.setTitle("Start", for: .normal)
            stopUpdating()
        }
    }
    
    
    func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) {
            [weak self] (activity: CMMotionActivity?) in
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.walking{
                    self?.calslbl.text = "walking"
                } else if activity.stationary {
                    self?.calslbl.text = "stationary"
                } else if activity.running {
                    self?.calslbl.text = "running"
                }
            }
        }
    }
    
    
    
    func countSteps() {
        pedometer.startUpdates(from: Date()){
            [weak self] pedometerData, error in
            guard let pedometerData = pedometerData, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.stepslbl.text = pedometerData.numberOfSteps.stringValue
                self?.dist = pedometerData.distance?.doubleValue
                
                guard
                    let distance = self?.dist,
                    let milesRes = self?.miles(meters: distance)
                    else {
                        self?.distlbl.text = "N/A"
                        return
                }
                
                self?.distlbl.text = String (format:"%02.03f mi", milesRes)
            }
        }
    }
    
    func startUpdating(){
        
        if CMMotionActivityManager.isActivityAvailable(){
            startTrackingActivityType()
        }
        if CMPedometer.isStepCountingAvailable(){
            countSteps()
        }
    }
    
    
    func stopUpdating(){
        activityManager.stopActivityUpdates()
        pedometer.stopUpdates()
        pedometer.stopEventUpdates()
    }
    
    func miles(meters:Double)-> Double{
        let mile = 0.000621371192
        return meters * mile
    }
    
    
}

