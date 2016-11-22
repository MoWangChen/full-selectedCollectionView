//
//  UICollectionView+fullSelected.h
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/6/2.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  collectionView 多选分类
 */

@protocol MXFullSelectedCollectionDelegate <NSObject>

- (BOOL)collectionView:(UICollectionView *)collectionView fullSelectedItemAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface UICollectionView (fullSelected)

@property (nonatomic, assign) id<MXFullSelectedCollectionDelegate> MXDelegate;

@end
