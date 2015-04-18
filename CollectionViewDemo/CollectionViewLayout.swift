//
//  CollectionViewLayout.swift
//  CollectionViewDemo
//
//  Created by Allen on 15/4/17.
//  Copyright (c) 2015年 Elin. All rights reserved.
//

import UIKit

class CollectionViewLayout: UICollectionViewLayout {

    var delegate:UICollectionViewDelegateFlowLayout?
    var cellCount:Int?
    var colArr = [Double]()
    var attributeDict = Dictionary<NSIndexPath,String>()
    let colCount = 3
    
    override func prepareLayout() {
        super.prepareLayout()
        self.delegate = self.collectionView?.delegate as! UICollectionViewDelegateFlowLayout
        cellCount = self.collectionView?.numberOfItemsInSection(0)
        
        if cellCount == 0 {
            return
        }
        
        var top = 0.0
        for var i = 0;i<colCount;i++ {
            colArr.append(top)
        }
        
        for var i = 0;i<colCount;i++ {
            layoutItemAtIndexPath(indexPath: NSIndexPath(forItem: i, inSection: 0))
        }
    }
    
    func layoutItemAtIndexPath(#indexPath:NSIndexPath){
        var edgeInsets = self.delegate?.collectionView!(self.collectionView!, layout: self, insetForSectionAtIndex: indexPath.row)
        
        var itemSize = self.delegate?.collectionView!(self.collectionView!, layout: self, sizeForItemAtIndexPath: indexPath)
        
        var minHeightCol = 0
        var minHeight = colArr[0]
        for var i = 0;i<colArr.count;i++ {
            if(colArr[i]<minHeight){
                minHeight = colArr[i]
                minHeightCol = i
            }
        }
        
        var minHeightColTop = colArr[minHeightCol]
        var frame = CGRect(x: Double(edgeInsets!.left) + Double(minHeightCol) * Double(edgeInsets!.left + itemSize!.width), y: Double(minHeightColTop) + Double(edgeInsets!.top), width: Double(itemSize?.width ?? 0), height: Double(itemSize?.height ?? 0))
        
        colArr[minHeightCol] = minHeightColTop + Double(edgeInsets!.top ?? 0) + Double(itemSize!.height)
        
        attributeDict[indexPath] = NSStringFromCGRect(frame)
        
    }
    
    
    func indexPathsOfItem(#rect:CGRect)->[NSIndexPath]{
        //遍历布局字典通过CGRectIntersectsRect方法确定每个cell的rect与传入的rect是否有交集，如果结果为true，则此cell应该显示，将布局字典中对应的indexPath加入数组
        var array = [NSIndexPath]()
        for (indexPath,rectStr) in attributeDict{
            var cellRect = CGRectFromString(rectStr)
            if CGRectIntersectsRect(cellRect, rect){
                array.append(indexPath)
            }
        }
        return array
    }
    
    
    
    //返回cell的布局信息，如果忽略传入的rect一次性将所有的cell布局信息返回，图片过多时性能会很差
//    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
//        var array = [UICollectionViewLayoutAttributes]()
//        //indexPathsOfItem方法，根据传入的frame值计算当前应该显示的cell
//        var indexPaths = self.indexPathsOfItem(rect: rect)
//        for indexPath in indexPaths{
//            var attribute = self.layoutAttributesForItemAtIndexPath(indexPath)
//            if attribute != nil {
//            array.append(attribute)
//        
//            }
//        }
//        return array
//    }
    
    //最后还要实现这个方法，返回collectionView内容的大小
    //只需要遍历前面创建的存放列高的数组得到列最高的一个作为高度返回就可以了
    override func  collectionViewContentSize() -> CGSize {
        var size = self.collectionView?.frame.size
        var maxHeight = colArr[0]
        
        for height in colArr{
            if height > maxHeight{
                maxHeight = height
            }
        }
        size?.height = CGFloat(maxHeight)
        
        return size!
    }}
