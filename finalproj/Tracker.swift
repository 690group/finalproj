import UIKit
import CoreMotion

class Tracker: UIViewController {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var stepslbl: UILabel!
    @IBOutlet weak var distlbl: UILabel!
    @IBOutlet weak var calslbl: UILabel!
    
    @IBOutlet weak var activityLabel: UILabel!
    
    
    var numOfSteps:Int! = nil
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
        let day = calendar.component(.day, from: date)
        
       // switch {}
        
        
        
        return "\(month)/\(day)/\(year)"
    }
    
    
    
    
    
    override func viewDidLoad() {
        dateLbl.text = currentTime()
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
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
   
    
    
    
    
    @IBAction func butp(_ sender: Any) {
        activityLabel.text = "button was pressed"
    }
    
    /*
    open func queryPedometerData(from start: Date, to end: Date, withHandler handler: @escaping CMPedometerHandler){
        
    }
    
    
    open func startUpdates(from start: Date, withHandler handler: @escaping CMPedometerHandler){
        
    }
    
    
    
   
    */
    
     func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) {
            [weak self] (activity: CMMotionActivity?) in
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.walking{
                    self?.activityLabel.text = "walking"
                } else if activity.stationary {
                    self?.activityLabel.text = "stationary"
                } else if activity.running {
                    self?.activityLabel.text = "running"
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
    
 
    
}

