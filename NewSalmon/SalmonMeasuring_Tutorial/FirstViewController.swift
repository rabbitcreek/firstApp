//
//  FirstViewController.swift
//  SalmonMeasuring_Tutorial
//
//  Created by RobertW. on 10/28/18.
//  Copyright © 2018 RobertW. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var salmonview: UIImageView!
    
    @IBOutlet weak var picker: UIPickerView!
    let fruit = [["Pink Salmon", "Chum Salmon", "Coho Salmon", "Sockeye Salmon", "Chinook Salmon", "Black Cod", "Black Rockfish", "YellowEye Rockfish", "Pacific Halibut", "Rainbow Trout", "Arctic Greyling", "Dollie Varden" ]]
    let fishAb: [[Double]] = [[0.0089, 3.25], [0.1408, 3.00], [0.0112, 3.0],[0.01555, 3], [0.01333,3], [0.0102, 3.03], [0.02111, 3.0], [0.01384, 3.00], [0.0071, 3.10], [0.00955, 3.03], [0.00832, 3.08], [0.00537, 3.03]]
    var fruitSelected: String = ""
    var aNumber: float_t = 0.0
    var bNumber: float_t = 0.0
    var numberRow = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruit[0].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fruit[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fruitSelected = fruit[0][row]
        print( fishAb [row][0], fishAb[row][1])
        numberRow = row
        
        // now, every time someone changes the Picker View's value, fruitSelected will be whatever they chose.
    }

    @IBAction func done(_ sender: Any) {
        self.aNumber = float_t(fishAb[numberRow][0])
        self.bNumber = float_t(fishAb[numberRow][1])
        performSegue(withIdentifier: "name", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! ViewController
        vc.finalA = float_t(self.aNumber)
        vc.finalB = self.bNumber
    }
}
