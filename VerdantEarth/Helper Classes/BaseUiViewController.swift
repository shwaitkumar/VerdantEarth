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

extension UIImage {
    /// Fix image orientaton to protrait up
    func fixedOrientation() -> UIImage? {
        guard imageOrientation != UIImage.Orientation.up else {
            // This is default orientation, don't need to do anything
            return self.copy() as? UIImage
        }

        guard let cgImage = self.cgImage else {
            // CGImage is not available
            return nil
        }

        guard let colorSpace = cgImage.colorSpace, let ctx = CGContext(data: nil, width: Int(size.width), height: Int(size.height), bitsPerComponent: cgImage.bitsPerComponent, bytesPerRow: 0, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
            return nil // Not able to create CGContext
        }

        var transform: CGAffineTransform = CGAffineTransform.identity

        switch imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: CGFloat.pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.rotated(by: CGFloat.pi / 2.0)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: size.height)
            transform = transform.rotated(by: CGFloat.pi / -2.0)
        case .up, .upMirrored:
            break
        @unknown default:
            fatalError("Missing...")
            break
        }

        // Flip image one more time if needed to, this is to prevent flipped image
        switch imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .up, .down, .left, .right:
            break
        @unknown default:
            fatalError("Missing...")
            break
        }

        ctx.concatenate(transform)

        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.height, height: size.width))
        default:
            ctx.draw(cgImage, in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            break
        }

        guard let newCGImage = ctx.makeImage() else { return nil }
        return UIImage.init(cgImage: newCGImage, scale: 1, orientation: .up)
    }
    
}
