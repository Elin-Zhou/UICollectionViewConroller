//
//  CollectionViewController.swift
//  CollectionViewDemo
//
//  Created by Allen on 15/4/17.
//  Copyright (c) 2015年 Elin. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var layout = UICollectionViewLayout()
        collectionView?.backgroundColor = UIColor.yellowColor()

        //注册cell类（必须）
        self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //返回item个数
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 17
    }
    //根据indexPath返回指定内容的UICollectionViewCell
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.setImage(image: UIImage(named: "huoying\(indexPath.row+1)")!)
        cell.backgroundColor = UIColor.blackColor()
        return cell

    }


}
