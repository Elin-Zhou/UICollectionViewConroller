//
//  CollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Allen on 15/4/17.
//  Copyright (c) 2015年 Elin. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var image:UIImage?
    func setImage(#image:UIImage){
        self.image = image
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        image?.drawInRect(CGRectMake(0, 0, 100, 100))
        
    }
}
