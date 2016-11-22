//
//  XieCollectionViewController.h
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/2/29.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MXCellClickFinish)(id item);

@interface XieCollectionViewController : UIViewController

@property (nonatomic, copy) MXCellClickFinish clickHandler;

@end
