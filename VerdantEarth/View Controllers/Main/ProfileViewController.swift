//
//  ProfileViewController.swift
//  VerdantEarth
//
//  Created by Shwait Kumar on 23/01/22.
//

import UIKit

class ProfileViewController: BaseUiViewController {

    @IBOutlet weak var viewProfilePicBg: UIView!
    
    @IBOutlet weak var ivPersonStatic: UIImageView!
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var btnDone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewProfilePicBg.layer.cornerRadius = 10.33
        ivPersonStatic.layer.cornerRadius = 10.33
        ivUser.layer.cornerRadius = 10.33
        
        viewProfilePicBg.layer.shadowRadius = 9.33
        viewProfilePicBg.layer.shadowOffset = CGSize(width: 4, height: 4)
        viewProfilePicBg.layer.shadowOpacity = 1.0
        viewProfilePicBg.layer.shadowColor = UIColor.lightGray.cgColor
        
        btnDone.layer.cornerRadius = 10
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func btnDone(_ sender: Any) {
    }
    
}
