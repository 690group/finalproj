import UIKit

class Calculator: UIViewController {
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    var gender = ""
    var activityLevel = 0.0
    var caloriesToAdjust = 0.0
    @IBAction func genderSelected(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            gender = "male";
        case 1:
            gender = "female";
        default:
            gender = "male";
            break;
        }
    }
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var feet: UITextField!
    
    @IBOutlet weak var inches: UITextField!
    
    
    //lose a pound every 4 weeks
    @IBAction func FatLossGoal(_ sender: Any) {
        caloriesToAdjust = -125
        }
    
    @IBAction func maintenanceGoal(_ sender: Any) {
        caloriesToAdjust = 0
    }
    
    //gain a pound every week
    @IBAction func gainMuscleGoal(_ sender: Any) {
        caloriesToAdjust = 500
    }
    
    @IBAction func sedentaryLevel(_ sender: Any) {
        activityLevel = 1.1
    }
    
    @IBAction func moderateLevel(_ sender: Any) {
        activityLevel = 1.3
    }
    
    @IBAction func activeLevel(_ sender: Any) {
        activityLevel = 1.5
    }

    
    @IBOutlet weak var formBackground: UIImageView!
    
    //function for calculating the inputted weight of user to kilograms for calculation
    var calculatedResults = ""
    var universalWeight = ""
    @IBAction func calculateTDEE(_ sender: Any) {
        
        let inputedFeet = Double(feet.text!)
        let inputedInches = Double(inches.text!)
        let inputedWeight = Double(weight.text!)
        let inputedAge = Double(age.text!)
        let inputedCalories = caloriesToAdjust
        let inputedActivityLevel = activityLevel
        
        if (gender == "" || gender == "male") {
            print(inputedCalories)
            print(inputedActivityLevel)
            
            
            let maleResults = TDEEModelMALE(feet: inputedFeet!, inches: inputedInches!, weight: inputedWeight!, age: inputedAge!, caloriesToAdjust: inputedCalories, activityLevel: inputedActivityLevel)
            
            self.universalWeight = String(inputedWeight!)
            self.calculatedResults = String(maleResults.TDEEMale())
               performSegue(withIdentifier: "transitionToResultsView", sender: self)
        }
            
        else if (gender != "" && gender == "female"){
            print(inputedCalories)
            print(inputedActivityLevel)
            
            let femaleResults = TDEEModelFEMALE(feet: inputedFeet!, inches: inputedInches!, weight: inputedWeight!, age: inputedAge!, caloriesToAdjust: inputedCalories, activityLevel: inputedActivityLevel)
            
            self.universalWeight = String(inputedWeight!)
            self.calculatedResults = String(femaleResults.TDEEFemale())
               performSegue(withIdentifier: "transitionToResultsView", sender: self)
        }
      
     
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! resultsCalculator
        vc.finalCalculations=self.calculatedResults
        vc.finalWeight=self.universalWeight
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.formBackground.image = UIImage(named: "graybackground")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

