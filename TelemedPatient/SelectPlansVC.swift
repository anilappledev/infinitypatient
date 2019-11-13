//
//  SelectPlansVC.swift
//  Telemed
//
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import UPCarouselFlowLayout

class SelectPlansVC: UIViewController {

    @IBOutlet fileprivate var Collectionview : UICollectionView!
    @IBOutlet fileprivate var pageController : UIPageControl!
    
    @IBOutlet weak var lbeNav: UILabel!

    
    
    var currentIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentIndex = 0
        setupLayout()
        setupPageController()
    }
    
    fileprivate func setupPageController()
    {
        pageController.numberOfPages = 3
    }
    
    
    @IBAction fileprivate func CloseAction (_ sender : UIButton)
    {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // collection View Flow Layout
    fileprivate func setupLayout() {
        self.Collectionview.dataSource  = self
        self.Collectionview.delegate = self

        let screenSize = UIScreen.main.bounds
               let screenWidth = screenSize.width - 72
               let screenHeight = screenSize.height - 200

        
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight )
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.overlap(visibleOffset: 0)
        layout.sideItemScale = 0.9
        layout.scrollDirection = .horizontal
        Collectionview.collectionViewLayout = layout
        
    }
}

extension SelectPlansVC : UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
{
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 3
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.row == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCell", for: indexPath) as? IntroductionCell
            
            return cell ?? UICollectionViewCell()
        }
        else if (indexPath.row == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCell1", for: indexPath) as? IntroductionCell1

            return cell ?? UICollectionViewCell()
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroductionCell2", for: indexPath) as? IntroductionCell2

            return cell ?? UICollectionViewCell()
        }
       
        
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {



        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width - 72
        let screenHeight = screenSize.height - 200

        return CGSize(width: screenWidth, height: screenHeight )

    }

   
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//
////        if section == 0 {
////            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
////
////        }
////        if section == 1 {
////            return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)
////
////        }
//
//        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let center = CGPoint(x: scrollView.contentOffset.x + (scrollView.frame.width / 2), y: (scrollView.frame.height / 2))
        if let ip = self.Collectionview!.indexPathForItem(at: center) {
            self.pageController.currentPage = ip.row
        }
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PlansDetailsVC") as! PlansDetailsVC
            vc.strPlaneName = "Infinity Health"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 1 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PlansDetailsVC") as! PlansDetailsVC
            vc.strPlaneName = "On Demand"

            self.navigationController?.pushViewController(vc, animated: true)
        }
        if indexPath.row == 2 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "PlansDetailsVC") as! PlansDetailsVC
            vc.strPlaneName = "Infinity Gol"

            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
   
    
    
}

