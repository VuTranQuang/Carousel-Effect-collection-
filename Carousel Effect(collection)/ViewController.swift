//
//  ViewController.swift
//  Carousel Effect(collection)
//
//  Created by RTC-HN154 on 10/10/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var interests = Interest.createInterests()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate struct Storyboard {
        static let CellIdentifier = "cell"
        static let CellPadding: CGFloat = 20.0
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! InterestCollectionViewCell
        cell.interest = self.interests[indexPath.item]
        
        return cell
    }
}
extension ViewController: UICollectionViewDelegate {
    
    // Chưa biết tác dụng để làm gì???
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let originPoit = targetContentOffset.pointee
//        var index = Int(originPoit.x / UIScreen.main.bounds.width)
//        let offset = Int(originPoit.x) % Int(UIScreen.main.bounds.width)
//        index += (offset > Int(UIScreen.main.bounds.width/2) ? 1 : 0)
//        targetContentOffset.pointee = CGPoint(x: index * Int(UIScreen.main.bounds.width), y: 0)
//    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 2 * Storyboard.CellPadding, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2 * Storyboard.CellPadding
    }
    
    // căn chỉnh vị trí của item(sát lề trên dưới và cách trái phải 20)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: Storyboard.CellPadding, bottom: 0, right: Storyboard.CellPadding)
    }
}

