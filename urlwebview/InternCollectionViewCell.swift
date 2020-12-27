//
//  InternCollectionViewCell.swift
//  urlwebview
//
//  Created by Shyam Kumar on 8/24/20.
//  Copyright © 2020 Shyam Kumar. All rights reserved.
//

import UIKit
import AppstoreTransition

class InternCollectionViewCell: UICollectionViewCell {

    
   
    @IBOutlet weak var containerV: UIView!
    
    @IBOutlet weak var imgV: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    @IBOutlet weak var dateLbl: UILabel!
    
    @IBOutlet weak var amountLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        containerV.layer.cornerRadius = 8
              containerV.clipsToBounds = true
   
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
         animate(isHighlighted: true)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
         animate(isHighlighted: false)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
         animate(isHighlighted: false)
    }

}

extension InternCollectionViewCell: CardCollectionViewCell {
    
    var cardContentView: UIView {
        get {
            return containerV
        }
    }
    
}

