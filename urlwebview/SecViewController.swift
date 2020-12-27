//
//  SecViewController.swift
//  urlwebview
//
//  Created by Shyam Kumar on 8/24/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import UIKit
import AppstoreTransition

class SecViewController: UIViewController {

 
    @IBOutlet weak var collV: UICollectionView!
    
    var transition : CardTransition?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collV.dataSource = self
         collV.delegate = self
       
        collV.register(UINib(nibName: "InternCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "cell")
        
        let layout = (collV.collectionViewLayout as! UICollectionViewFlowLayout)
        let aspect: CGFloat = 1.272
        let width = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width:width, height: width * aspect)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
      
     
    }
    

}

extension SecViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        
        return cell
    }
    
}

extension SecViewController: UICollectionViewDelegate {

 func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
      showType2(indexPath: indexPath)
    
    }
    
    
    private func showType2(indexPath: IndexPath, bottomDismiss: Bool = false) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "type2") as! Type2ViewController
        
        // Get tapped cell location
          let cell = collV.cellForItem(at: indexPath) as! CardCollectionViewCell
        cell.settings.cardContainerInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        cell.settings.isEnabledBottomClose = bottomDismiss
        
        transition = CardTransition(cell: cell, settings: cell.settings)
        viewController.settings = cell.settings
          viewController.transitioningDelegate = transition
        
        // If `modalPresentationStyle` is not `.fullScreen`, this should be set to true to make status bar depends on presented vc.
        //viewController.modalPresentationCapturesStatusBarAppearance = true
        viewController.modalPresentationStyle = .custom
        
        presentExpansion(viewController, cell: cell, animated: true)
    }
}

extension SecViewController: CardsViewController {
    
}




