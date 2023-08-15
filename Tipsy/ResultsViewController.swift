
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var billText: String?
    var people: String?
    var tip: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = billText
        settingsLabel.text = "Split between \(people!) people, with \(tip!) tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
