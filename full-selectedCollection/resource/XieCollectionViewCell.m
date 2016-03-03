//
//  XieCollectionViewCell.m
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/3/3.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "XieCollectionViewCell.h"

@interface XieCollectionViewCell ()

@property (nonatomic, strong) UIView *backGroundView;           //圆角背景

@property (nonatomic, strong) UILabel *textLabel;               //文字label

@property (nonatomic, strong) UIView *selectedView;             //选中状态视图

@end

@implementation XieCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // backgroundView
        self.backGroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.backGroundView.backgroundColor = [UIColor darkGrayColor];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        [self.contentView addSubview:self.backGroundView];
        
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _textLabel.text = @"哎呀";
        _textLabel.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self.backGroundView addSubview:_textLabel];
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2-20, 20, 40, 40)];
        imageView.image = [UIImage imageNamed:@"logo"];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.backGroundView addSubview:imageView];
        
        
        // 编辑状态下，附加视图，显示选中效果
        
        self.selectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.selectedView.backgroundColor = [UIColor clearColor];
        [self.backGroundView addSubview:self.selectedView];
        
        UIView *halfAlphaView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        halfAlphaView.backgroundColor = [UIColor whiteColor];
        halfAlphaView.alpha = 0.5;
        [self.selectedView addSubview:halfAlphaView];
        
        UIImageView *selectedImage = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width-25, frame.size.height-25, 17, 17)];
        selectedImage.image = [UIImage imageNamed:@"ic_p3_choose"];
        selectedImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.selectedView addSubview:selectedImage];
        
        
        
        
    }
    return self;
}

- (void)cellInfoWithDictionary:(NSDictionary *)dict withEditingMode:(BOOL)isEditing
{
    self.selectedView.hidden = YES;
    
    _textLabel.text = dict[@"data"];
    
    if (isEditing) {
        
        if ([dict[@"selected"] intValue] == 1) {
            
            self.selectedView.hidden = NO;
        }
    }
}


@end
