//
//  BaseUiViewController.swift
//  VerdantEarth
//
//  Created by Shwait Kumar on 09/01/22.
//

import UIKit
import HandyUIKit

class BaseUiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        
        configureNavigationBar(preferredLargeTitle: true)
        
    }
    
    func carbonDioxideSymbol() -> String {
        return "CO₂"
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func configureNavigationBar(preferredLargeTitle: Bool) {
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithTransparentBackground()
            
            navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "labelColor")!, .font: UIFont(name: "HindSiliguri-Bold", size: 34)!]
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "labelColor")!, .font: UIFont(name: "HindSiliguri-Bold", size: 20)!]
            
//            navigationController?.navigationBar.isTranslucent = true
//            navBarAppearance.backgroundColor = UIColor.clear
//
//            navigationController?.navigationBar.standardAppearance = navBarAppearance
//            navigationController?.navigationBar.compactAppearance = navBarAppearance
//            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

            navigationController?.navigationBar.prefersLargeTitles = preferredLargeTitle
            navigationController?.navigationBar.tintColor =  UIColor(named: "labelColor")!
            navigationItem.title = title

        } else {
            // Fallback on earlier versions
            navigationController?.navigationBar.barTintColor = UIColor.clear
            navigationController?.navigationBar.tintColor = UIColor(named: "labelColor")!
            navigationController?.navigationBar.isTranslucent = true
            navigationController?.navigationBar.backgroundColor = UIColor.clear
            navigationItem.title = title
        }
    }
    
}
