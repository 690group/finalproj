import UIKit

class Calculator: UIViewController{
    

    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    
    //be able to get out of keyboard
    @IBAction func returnFromAge(_ sender: UITextField) {
        view.endEditing(true)

    }
    
    //be able to get out of keyboard
    @IBAction func returnFromWeight(_ sender: UITextField) {
        view.endEditing(true)

    }
    
    //be able to get out of keyboard
    @IBAction func returnFromFeet(_ sender: UITextField) {
        view.endEditing(true)

    }
    
    //be able to get out of keyboard
    @IBAction func returnFromInches(_ sender: UITextField) {
        view.endEditing(true)

    }
    
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
 
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var formBackground: UIImageView!
    
    //function for calculating the inputted weight of user to kilograms for calculation
    var calculatedResults = ""
    var universalWeight = ""
    
    @IBAction func calculateTDEE(_ sender: Any) {
        
        //this guard statements makes it so that the user cannot submit form without inputing the values
        guard let inputedFeet = Double(feet.text!),
            let inputedInches = Double(inches.text!),
            let inputedWeight = Double(weight.text!),
            let inputedAge = Double(age.text!) else {
            print("Form is not inputed")
            return
        }
        
        //this guard statement enforces user to select a goal and activity level before submitting
        let inputedCalories = caloriesToAdjust
        let inputedActivityLevel = activityLevel
        
        //checking for valid inputs
        if (inputedAge >= 0 && inputedAge <= 120 && inputedWeight >= 0 && inputedWeight <= 700
            && inputedInches >= 0 && inputedInches <= 12 && inputedFeet >= 0 && inputedFeet <= 8 ) {

            //while default and male continue to calculations
            if (gender == "" || gender == "male") {
        
            let maleResults = TDEEModelMALE(feet: inputedFeet, inches: inputedInches, weight: inputedWeight, age: inputedAge, caloriesToAdjust: inputedCalories, activityLevel: inputedActivityLevel)
            
            self.universalWeight = String(inputedWeight)
            self.calculatedResults = String(maleResults.TDEEMale())
               performSegue(withIdentifier: "transitionToResultsView", sender: self)
            }
            
            //while not default and female continue to calcuations
        else if (gender != "" && gender == "female"){

            let femaleResults = TDEEModelFEMALE(feet: inputedFeet, inches: inputedInches, weight: inputedWeight, age: inputedAge, caloriesToAdjust: inputedCalories, activityLevel: inputedActivityLevel)
            
            self.universalWeight = String(inputedWeight)
            self.calculatedResults = String(femaleResults.TDEEFemale())
               performSegue(withIdentifier: "transitionToResultsView", sender: self)
        }
      
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! resultsCalculator
        vc.finalCalculations=self.calculatedResults
        vc.finalWeight=self.universalWeight
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //give rounded button effect
        calculateButton.layer.cornerRadius = calculateButton.frame.size.height/3
        
         self.formBackground.image = UIImage(named: "graybackground")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

