//
//  HomeViewController.swift
//  VerdantEarth
//
//  Created by Shwait Kumar on 10/01/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tblHome: UITableView!
    
    var buttonTag = ""
    var cellTag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.title = "Home"
        
        self.tblHome?.delegate = self
        self.tblHome?.dataSource = self
        
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 16.0
//    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 32.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "1"
//        }
//        else {
//            return "2"
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
        
        if section == 0 {
            return 1
        }
        else {
            return 8
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
            
            return cell
        }
        
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            
            if indexPath.row == 0 {
                cell.lblTitle.text = "Fuel to " + BaseUiViewController().carbonDioxideSymbol()
                cell.ivIcon.image = UIImage(systemName: "fuelpump.fill")
            }
            else if indexPath.row == 1 {
                cell.lblTitle.text = "Carbon Footprint from Public Transit"
                cell.ivIcon.image = UIImage(systemName: "car.2.fill")
            }
            else if indexPath.row == 2 {
                cell.lblTitle.text = "Carbon Footprint from Flight"
                cell.ivIcon.image = UIImage(systemName: "airplane.departure")
            }
            else if indexPath.row == 3 {
                cell.lblTitle.text = "Carbon Footprint from Motor Bike"
                cell.ivIcon.image = UIImage(systemName: "bicycle")
            }
            else if indexPath.row == 4 {
                cell.lblTitle.text = "Carbon Footprint from Car Travel"
                cell.ivIcon.image = UIImage(systemName: "car.fill")
            }
            else if indexPath.row == 5 {
                cell.lblTitle.text = "Traditional Hydro to Carbon Footprint"
                cell.ivIcon.image = UIImage(systemName: "bolt.batteryblock.fill")
            }
            else if indexPath.row == 6 {
                cell.lblTitle.text = "Clean Hydro to Carbon Footprint"
                cell.ivIcon.image = UIImage(systemName: "sun.min.fill")
            }
            else {
                cell.lblTitle.text = "Tree Equivalent"
                cell.ivIcon.image = UIImage(systemName: "leaf.fill")
            }

            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            self.performSegue(withIdentifier: "toProfile", sender: nil)
        }
        else {
            if indexPath.row == 0 {
                buttonTag = "Fuel to " + BaseUiViewController().carbonDioxideSymbol()
                cellTag = 0
                pushVC()
            }
            else if indexPath.row == 1 {
                buttonTag = BaseUiViewController().carbonDioxideSymbol() + " from Public Transit"
                cellTag = 1
                pushVC()
            }
            else if indexPath.row == 2 {
                buttonTag = BaseUiViewController().carbonDioxideSymbol() + " from Flight"
                cellTag = 2
                pushVC()
            }
            else if indexPath.row == 3 {
                buttonTag = BaseUiViewController().carbonDioxideSymbol() + " from Motor Bike"
                cellTag = 3
                pushVC()
            }
            else if indexPath.row == 4 {
                buttonTag = BaseUiViewController().carbonDioxideSymbol() + " from Car Travel"
                cellTag = 4
                pushVC()
            }
            else if indexPath.row == 5 {
                buttonTag = "Traditional Hydro to " + BaseUiViewController().carbonDioxideSymbol()
                cellTag = 5
                pushVC()
            }
            else if indexPath.row == 6 {
                buttonTag = "Clean Hydro to " + BaseUiViewController().carbonDioxideSymbol()
                cellTag = 6
                pushVC()
            }
            else {
                buttonTag = "Tree Equivalent"
                cellTag = 7
                pushVC()
            }
        }
        
    }
    
    func pushVC() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CalculateCarbonFootprintViewController") as! CalculateCarbonFootprintViewController
        vc.viewFrom = buttonTag
        vc.cellTag = cellTag
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewCardProfile: UIView!
    @IBOutlet weak var viewBgUser: UIView!
    
    @IBOutlet weak var ivBgUser: UIImageView!
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTotalCarbonEmitted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        viewBgUser.layer.cornerRadius = 36
        ivBgUser.layer.cornerRadius = 36
        ivUser.layer.cornerRadius = 36
        
        viewBgUser.layer.shadowRadius = 4.33
        viewBgUser.layer.shadowOffset = .zero
        viewBgUser.layer.shadowOpacity = 1.0
        viewBgUser.layer.shadowColor = UIColor.lightGray.cgColor
        
    }
    
//    override func layoutSubviews() {
//        layer.cornerRadius = 10.33
//        
////        let margins = contentView.layoutMarginsGuide
////        contentView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 16).isActive = true
//    }
    
}

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ivIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
    }
    
}
