//
//  XieBottomView.h
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/2/29.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, BottomViewStyle){
    BottomViewStyleDefaulet,
    BottomViewStyleOnlySave
};

@interface XieBottomView : UIView

@property (nonatomic, strong) UITapGestureRecognizer *leftTap;

@property (nonatomic, strong) UITapGestureRecognizer *rightTap;

@property (nonatomic, assign) BottomViewStyle mode;                 // (编辑模式下，两种类型，能否保存网络菜单)


/**
 *  初始化方法
 *
 *  @param frame      位置大小
 *  @param leftName   左边视图label
 *  @param leftImage  左边视图图片
 *  @param rightName  右边视图label
 *  @param rightImage 右边视图图片
 *
 *  @return UIView
 */
-(instancetype)initWithFrame:(CGRect)frame withLeftName:(NSString *)leftName leftImage:(UIImage *)leftImage rightName:(NSString *)rightName rightImage:(UIImage *)rightImage;


/**
 *  刷新视图
 *
 *  @param selectedNum 选中项数量
 */
- (void)refreshView:(NSInteger )selectedNum;

@end
