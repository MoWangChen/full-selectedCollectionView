//
//  UICollectionView+fullSelected.m
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/6/2.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "UICollectionView+fullSelected.h"
#import <objc/runtime.h>

static const void *MXDelegateKey = &MXDelegateKey;
static const void *recordDelegateKey = &recordDelegateKey;

@interface UICollectionView ()

@property (nonatomic, assign) id<UICollectionViewDelegate> recordDelegate;


@end

@implementation UICollectionView (fullSelected)

-(void)setMXDelegate:(id<MXFullSelectedCollectionDelegate>)MXDelegate
{
    self.recordDelegate = self.delegate;
    objc_setAssociatedObject(self, MXDelegateKey, MXDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id<MXFullSelectedCollectionDelegate>)MXDelegate
{
    return objc_getAssociatedObject(self, MXDelegateKey);
}

-(void)setRecordDelegate:(id<UICollectionViewDelegate>)recordDelegate
{
    objc_setAssociatedObject(self, recordDelegateKey, recordDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id<UICollectionViewDelegate>)recordDelegate
{
    return objc_getAssociatedObject(self, recordDelegateKey);
}

- (void)setSelectedView:(UIView *)selectedView
{
    
}


@end
