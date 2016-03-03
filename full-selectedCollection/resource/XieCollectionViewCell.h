//
//  XieCollectionViewCell.h
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/3/3.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XieCollectionViewCell : UICollectionViewCell

/**
 *  载入cell 数据
 *
 *  @param dict      cell 数据源
 *  @param isEditing 是否处于编辑模式
 */
- (void)cellInfoWithDictionary:(NSDictionary *)dict withEditingMode:(BOOL)isEditing;

@end
