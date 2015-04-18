//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Allen on 15/4/17.
//  Copyright (c) 2015年 Elin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var identifier = "collectionView"
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //注册UICollectionViewCell类
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        //设置UICollectionView的尺寸
        var bounds = CGRectMake(collectionView.bounds.origin.x, collectionView.bounds.origin.y, UIScreen.mainScreen().bounds.width, collectionView.bounds.height)
        collectionView.bounds = bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 17
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! UICollectionViewCell
        //设置背景色
        cell.backgroundColor = UIColor.purpleColor()
        
//        var button = UIButton(frame: CGRectMake(0, 0, 100, 100))
//        button.setImage(UIImage(named: "huoying\(indexPath.item+1)"), forState: UIControlState.Normal)
//        cell.contentView.addSubview(button)
        
        
        var label = UILabel(frame: CGRectMake(0, 0, 120, 120))
        label.text = String(indexPath.item)
        //必须把新的控件添加到contentView下，不能直接添加到cell中
        cell.contentView.addSubview(label)
        return cell

    }
    //当点击某个item时触发该方法
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.item)
    }
    
    //设置每个item的尺寸
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(100, 100)
    }
}
