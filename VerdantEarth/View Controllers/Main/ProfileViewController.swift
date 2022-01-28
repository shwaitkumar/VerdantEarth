//
//  ProfileViewController.swift
//  VerdantEarth
//
//  Created by Shwait Kumar on 23/01/22.
//

import UIKit

class ProfileViewController: BaseUiViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var viewProfilePicBg: UIView!
    
    @IBOutlet weak var ivPersonStatic: UIImageView!
    @IBOutlet weak var ivUser: UIImageView!
    
    @IBOutlet weak var tfName: UITextField!
    
    @IBOutlet weak var btnDone: UIButton!
    
    var picAnimated = false
    
    var imagePicker:UIImagePickerController?
    private weak var delegate: UIImagePickerControllerDelegate?
    
    var userBase64 = ""
    
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
        
        let tapProfilePicGesture = UITapGestureRecognizer(target: self, action:  #selector(self.addOrUpdateProfilePic))
        self.viewProfilePicBg.addGestureRecognizer(tapProfilePicGesture)
        
        self.imagePicker = UIImagePickerController()
        self.imagePicker?.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        if picAnimated == false {
            animateProfilePic()
        }

    }
    
    @objc func addOrUpdateProfilePic(sender : UITapGestureRecognizer) {
        openCameraGallery()
    }
    
    func animateProfilePic() {
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform.scale"
        animation.fromValue = 1
        animation.toValue = 2
        animation.duration = 0.5
            
        viewProfilePicBg.layer.add(animation, forKey: "basic")
        viewProfilePicBg.layer.transform = CATransform3DMakeScale(2, 2, 1) // update
        picAnimated = !picAnimated
        
    }
    
    @IBAction func btnDone(_ sender: Any) {
    }
    
    func openCameraGallery()
    {

        let alert = UIAlertController(title: "Verdant Earth", message: "Select Option", preferredStyle: .actionSheet)
            
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ (UIAlertAction)in
                self.present(self.imagePicker!, animated: true, completion: {
                    self.imagePicker?.sourceType = .camera
                    //self.imagePicker?.allowsEditing = true
                    self.imagePicker?.delegate = self
                })
            }))
            
        alert.addAction(UIAlertAction(title: "Gallery", style: .default , handler:{ (UIAlertAction)in
                
                self.present(self.imagePicker!, animated: true, completion: {
                    self.imagePicker?.sourceType = .photoLibrary
                    //self.imagePicker?.allowsEditing = true
                    self.imagePicker?.delegate = self
                })
            }))
            
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))
            
            self.present(alert, animated: true, completion: {
                print("completion block")
        })
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        {
            ivUser.image = editedImage.fixedOrientation()
        }
        else  if let editedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            ivUser.image = editedImage.fixedOrientation()
        }
        
        //Dismiss the UIImagePicker after selection
        picker.dismiss(animated: true, completion: nil)
        
        getImageBase64()
        
    }
    
    //MARK: Image picker delegate methods
    func doneButtonDidPress(_ imagePicker: UIImagePickerController, images: [UIImage]) {
        
        ivUser.image = images[0].fixedOrientation()
        
        getImageBase64()
        
    }
    
    func cancelButtonDidPress(_ imagePicker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: UIImagePickerController, images: [UIImage]) {
        
        ivUser.image = images[0].fixedOrientation()
        
        getImageBase64()
        
    }
    
    func getImageBase64()
    {
        
        if(ivUser.image != nil)
        {
            let imageData:NSData = ivUser.image!.jpegData(compressionQuality:  0.3)! as NSData
            userBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
        }
        
    }
    
}
