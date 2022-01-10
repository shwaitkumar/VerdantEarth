//
//  IntroductionViewController.swift
//  VerdantEarth
//
//  Created by Shwait Kumar on 09/01/22.
//

import UIKit

class IntroductionViewController: BaseUiViewController {

    @IBOutlet weak var btnGoToMainScreen: UIButton!
    
    @IBOutlet weak var cvIntroduction: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var viewForCVShadow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Introduction"
        navigationController?.navigationBar.isHidden = true
        
        btnGoToMainScreen.layer.cornerRadius = 10
        cvIntroduction.layer.cornerRadius = 20
        viewForCVShadow.layer.cornerRadius = 20
        viewForCVShadow.layer.shadowRadius = 10
        
        self.cvIntroduction?.delegate = self
        self.cvIntroduction?.dataSource = self
        
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = 4
        pageControl.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        
        let flowLayout = UPCarouselFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: cvIntroduction.frame.size.height)
        flowLayout.scrollDirection = .horizontal
        flowLayout.sideItemScale = 0.6
        flowLayout.sideItemAlpha = 1
        flowLayout.spacingMode = .fixed(spacing: 10)
        cvIntroduction?.collectionViewLayout = flowLayout
        
    }
    
    @IBAction func btnGoToMainScreen(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension IntroductionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCollectionViewCell", for: indexPath) as! IntroductionCollectionViewCell
        
        if indexPath.row == 0 {
            cell.lblIntro.text = "Calculate " + self.carbonDioxideSymbol() + " emission from Petrol or Diesel"
            cell.ivIntro.image = UIImage(systemName: "fuelpump.fill")
            pageControl.currentPage = 1
        }
        else if indexPath.row == 1 {
            cell.lblIntro.text = " Calculate " + self.carbonDioxideSymbol() + " emission from Public or Personal Transport"
            cell.ivIntro.image = UIImage(systemName: "car.2.fill")
            pageControl.currentPage = 2
        }
        else if indexPath.row == 2 {
            cell.lblIntro.text = "Check how much you can save by using clean energy"
            cell.ivIntro.image = UIImage(systemName: "bolt.fill.batteryblock.fill")
            pageControl.currentPage = 3
        }
        else {
            cell.lblIntro.text = "Calculate how many trees were cut for the paper you use."
            cell.ivIntro.image = UIImage(systemName: "leaf.fill")
            pageControl.currentPage = 4
        }
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

class IntroductionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewCellCard: UIView!
    
    @IBOutlet weak var ivIntro: UIImageView!
    
    @IBOutlet weak var lblIntro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        viewCellCard.layer.cornerRadius = 16
        
    }
    
}

