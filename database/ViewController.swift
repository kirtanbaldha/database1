
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Sqlite.createFile()
        
    }

    @IBAction func saveButton(_ sender: Any) {
        if let x = t1.text , let y = Int(x){
            Sqlite.addData(id: y, name: t2.text!)
        }
    }
    
    @IBAction func DELET(_ sender: Any) {
        if let x = t1.text , let y = Int(x){
            Sqlite.delteData(id: y, name: t2.text!)
        }
    }
}

