//
//  CalculateCarbonFootprintViewController.swift
//  VerdantEarth
//
//  Created by Shwait Kumar on 11/01/22.
//

import UIKit

class CalculateCarbonFootprintViewController: BaseUiViewController {
    
    @IBOutlet weak var tblCalculateCarbonFootprint: UITableView!
    
    var viewFrom = ""
    var cellTag = 0
    var buttonState = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = viewFrom
        
        self.tblCalculateCarbonFootprint.delegate = self
        self.tblCalculateCarbonFootprint.dataSource = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CalculateCarbonFootprintViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalculateCarbonFootprintTableViewCell", for: indexPath) as! CalculateCarbonFootprintTableViewCell
        
        if cellTag == 0 {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn2.isHidden = false
            cell.btn0.setTitle("Petrol", for: .normal)
            cell.btn1.setTitle("Diesel", for: .normal)
            cell.btn2.setTitle("LPG", for: .normal)
            cell.tf.placeholder = "Enter amount in litres"
        }
        else if cellTag == 1 {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn2.isHidden = false
            cell.btn3.isHidden = false
            cell.btn4.isHidden = false
            cell.btn5.isHidden = false
            cell.btn6.isHidden = false
            cell.btn0.setTitle("Taxi", for: .normal)
            cell.btn1.setTitle("Classic Bus", for: .normal)
            cell.btn2.setTitle("Eco Bus", for: .normal)
            cell.btn3.setTitle("Coach", for: .normal)
            cell.btn4.setTitle("National Train", for: .normal)
            cell.btn5.setTitle("Light Train", for: .normal)
            cell.btn6.setTitle("Subway", for: .normal)
            cell.tf.placeholder = "Enter distance in KM"
        }
        else if cellTag == 2 {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn2.isHidden = false
            cell.btn3.isHidden = false
            cell.btn4.isHidden = false
            cell.btn5.isHidden = false
            cell.btn6.isHidden = false
            cell.btn0.setTitle("Domestic Flight", for: .normal)
            cell.btn1.setTitle("Short Economy Class Flight", for: .normal)
            cell.btn2.setTitle("Short Business Class Flight", for: .normal)
            cell.btn3.setTitle("Long Economy Class Flight", for: .normal)
            cell.btn4.setTitle("Long Premium Class Flight", for: .normal)
            cell.btn5.setTitle("Long Business Class Flight", for: .normal)
            cell.btn6.setTitle("Long First Class Flight", for: .normal)
            cell.tf.placeholder = "Enter distance in KM"
        }
        else if cellTag == 3 {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn2.isHidden = false
            cell.btn0.setTitle("Small MotorBike", for: .normal)
            cell.btn1.setTitle("Medium MotorBike", for: .normal)
            cell.btn2.setTitle("Large MotorBike", for: .normal)
            cell.tf.placeholder = "Enter distance in KM"
        }
        else if cellTag == 4 {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn2.isHidden = false
            cell.btn3.isHidden = false
            cell.btn4.isHidden = false
            cell.btn5.isHidden = false
            cell.btn6.isHidden = false
            cell.btn7.isHidden = false
            cell.btn8.isHidden = false
            cell.btn0.setTitle("Small Diesel Car", for: .normal)
            cell.btn1.setTitle("Medium Diesel Car", for: .normal)
            cell.btn2.setTitle("Large Diesel Car", for: .normal)
            cell.btn3.setTitle("Small Hybrid Car", for: .normal)
            cell.btn4.setTitle("Medium Hybrid Car", for: .normal)
            cell.btn5.setTitle("Large Hybrid Car", for: .normal)
            cell.btn6.setTitle("Small Petrol Car", for: .normal)
            cell.btn7.setTitle("Medium Petrol Car", for: .normal)
            cell.btn8.setTitle("Large Petrol Car", for: .normal)
            cell.tf.placeholder = "Enter distance in KM"
        }
        else if cellTag == 5 {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn2.isHidden = false
            cell.btn3.isHidden = false
            cell.btn4.isHidden = false
            cell.btn5.isHidden = false
            cell.btn6.isHidden = false
            cell.btn7.isHidden = false
            cell.btn0.setTitle("USA", for: .normal)
            cell.btn1.setTitle("Canada", for: .normal)
            cell.btn2.setTitle("UK", for: .normal)
            cell.btn3.setTitle("Europe", for: .normal)
            cell.btn4.setTitle("Africa", for: .normal)
            cell.btn5.setTitle("Latin America", for: .normal)
            cell.btn6.setTitle("Middle East", for: .normal)
            cell.btn7.setTitle("Other Country", for: .normal)
            cell.tf.placeholder = "Enter amount consumed in KWH"
        }
        else if cellTag == 6 {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn2.isHidden = false
            cell.btn3.isHidden = false
            cell.btn4.isHidden = false
            cell.btn5.isHidden = false
            cell.btn6.isHidden = false
            cell.btn0.setTitle("Solar", for: .normal)
            cell.btn1.setTitle("Wind", for: .normal)
            cell.btn2.setTitle("Hydro Electric", for: .normal)
            cell.btn3.setTitle("Biomass", for: .normal)
            cell.btn4.setTitle("Geothermal", for: .normal)
            cell.btn5.setTitle("Tidal", for: .normal)
            cell.btn6.setTitle("Other Clean Energy", for: .normal)
            cell.tf.placeholder = "Enter amount consumed in KWH"
        }
        else {
            cell.btn0.isHidden = false
            cell.btn1.isHidden = false
            cell.btn0.setTitle("in kg", for: .normal)
            cell.btn1.setTitle("in lb", for: .normal)
            cell.tf.placeholder = "Enter weight of paper"
        }
        
        if buttonState == 1 {
            setDefaultBtnAttributes()
            cell.btn0.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn0.layer.borderWidth = 1.0
        }
        else if buttonState == 2 {
            setDefaultBtnAttributes()
            cell.btn1.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn1.layer.borderWidth = 1.0
        }
        else if buttonState == 3 {
            setDefaultBtnAttributes()
            cell.btn2.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn2.layer.borderWidth = 1.0
        }
        else if buttonState == 4 {
            setDefaultBtnAttributes()
            cell.btn3.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn3.layer.borderWidth = 1.0
        }
        else if buttonState == 5 {
            setDefaultBtnAttributes()
            cell.btn4.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn4.layer.borderWidth = 1.0
        }
        else if buttonState == 6 {
            setDefaultBtnAttributes()
            cell.btn5.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn5.layer.borderWidth = 1.0
        }
        else if buttonState == 7 {
            setDefaultBtnAttributes()
            cell.btn6.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn6.layer.borderWidth = 1.0
        }
        else if buttonState == 8 {
            setDefaultBtnAttributes()
            cell.btn7.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn7.layer.borderWidth = 1.0
        }
        else if buttonState == 9 {
            setDefaultBtnAttributes()
            cell.btn8.layer.borderColor = UIColor(named: "labelColor")?.cgColor
            cell.btn8.layer.borderWidth = 1.0
        }
        else {
            setDefaultBtnAttributes()
        }
        
        func setDefaultBtnAttributes() {
            setDeafult(btn: cell.btn0)
            setDeafult(btn: cell.btn1)
            setDeafult(btn: cell.btn2)
            setDeafult(btn: cell.btn3)
            setDeafult(btn: cell.btn4)
            setDeafult(btn: cell.btn5)
            setDeafult(btn: cell.btn6)
            setDeafult(btn: cell.btn7)
            setDeafult(btn: cell.btn8)
        }
        
        func setDeafult(btn: UIButton) {
            btn.layer.borderColor = UIColor.lightGray.cgColor
            btn.layer.borderWidth = 0.5
        }
        
        cell.btn0.tag = 1
        cell.btn1.tag = 2
        cell.btn2.tag = 3
        cell.btn3.tag = 4
        cell.btn4.tag = 5
        cell.btn5.tag = 6
        cell.btn6.tag = 7
        cell.btn7.tag = 8
        cell.btn8.tag = 9
        
        cell.btn0.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn1.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn2.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn3.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn4.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn5.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn6.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn7.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        cell.btn8.addTarget(self, action: #selector(selectButton(_:)), for: .touchUpInside)
        
        return cell
        
    }
    
    @objc func selectButton(_ sender: UIButton) {
        buttonState = sender.tag
        tblCalculateCarbonFootprint.reloadData()
    }
    
}

class CalculateCarbonFootprintTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tf: UITextField!
    
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnCalculate: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        btn0.layer.cornerRadius = 10
        btn1.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
        btn3.layer.cornerRadius = 10
        btn4.layer.cornerRadius = 10
        btn5.layer.cornerRadius = 10
        btn6.layer.cornerRadius = 10
        btn7.layer.cornerRadius = 10
        btn8.layer.cornerRadius = 10
        btn9.layer.cornerRadius = 10
        btnCalculate.layer.cornerRadius = 10
        
        setBorderColorWidthAndFontColor(btn: btn0)
        setBorderColorWidthAndFontColor(btn: btn1)
        setBorderColorWidthAndFontColor(btn: btn2)
        setBorderColorWidthAndFontColor(btn: btn3)
        setBorderColorWidthAndFontColor(btn: btn4)
        setBorderColorWidthAndFontColor(btn: btn5)
        setBorderColorWidthAndFontColor(btn: btn6)
        setBorderColorWidthAndFontColor(btn: btn7)
        setBorderColorWidthAndFontColor(btn: btn8)
        setBorderColorWidthAndFontColor(btn: btn9)
        
        btn0.isHidden = true
        btn1.isHidden = true
        btn2.isHidden = true
        btn3.isHidden = true
        btn4.isHidden = true
        btn5.isHidden = true
        btn6.isHidden = true
        btn7.isHidden = true
        btn8.isHidden = true
        btn9.isHidden = true
        
//        btn0.layer.borderWidth = 1
//        btn0.layer.borderColor = UIColor(named: "limeGreen")?.cgColor
//        btn0.titleLabel?.textColor = UIColor(named: "limeGreen")
        
        tf.keyboardType = .decimalPad
        
    }
    
    func setBorderColorWidthAndFontColor(btn: UIButton) {
        
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.lightGray.cgColor
//        btn.titleLabel?.textColor = UIColor(named: "spearMint")
        
    }
    
}
