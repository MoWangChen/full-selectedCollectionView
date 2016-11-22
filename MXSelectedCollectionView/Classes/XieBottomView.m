//
//  XieBottomView.m
//  full-selectedCollection
//
//  Created by 谢鹏翔 on 16/2/29.
//  Copyright © 2016年 谢鹏翔. All rights reserved.
//

#import "XieBottomView.h"


#define Name_Font           9.f
#define Name_Height         10.f


@interface XieBottomView ()

@property (nonatomic, strong) UIView *verticalLine;

@property (nonatomic, strong) UIView *leftView;

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UIImageView *leftImageView;

@property (nonatomic, strong) UIView *rightView;

@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation XieBottomView

-(instancetype)initWithFrame:(CGRect)frame withLeftName:(NSString *)leftName leftImage:(UIImage *)leftImage rightName:(NSString *)rightName rightImage:(UIImage *)rightImage
{
    if (self = [super initWithFrame:frame]) {
        UIView *horizontalLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
        horizontalLine.backgroundColor = [UIColor grayColor];
        [self addSubview:horizontalLine];
        
        
        _verticalLine = [[UIView alloc] initWithFrame:CGRectMake(self.center.x, 0, 1, frame.size.height)];
        _verticalLine.backgroundColor = [UIColor grayColor];
        [self addSubview:_verticalLine];
        
        
        // left action
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, self.center.x, frame.size.height-1)];
        _leftView.backgroundColor = [UIColor clearColor];
        
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.frame = CGRectMake(0, 0, 50, Name_Height);
        _leftLabel.text = leftName;
        _leftLabel.textAlignment = NSTextAlignmentCenter;
        _leftLabel.textColor = [UIColor orangeColor];
        _leftLabel.font = [UIFont systemFontOfSize:Name_Font];
        _leftLabel.center = CGPointMake(frame.size.width/4 ,frame.size.height/2+10);
        [_leftView addSubview:_leftLabel];
        
        
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.image = leftImage;
        _leftImageView.frame = CGRectMake(0, 0, 20, 20);
        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        _leftImageView.center = CGPointMake(frame.size.width/4, frame.size.height/2-5);
        [_leftView addSubview:_leftImageView];
        
        [self addSubview:_leftView];
        
        _leftTap = [[UITapGestureRecognizer alloc] init];
        [_leftView addGestureRecognizer:_leftTap];
        
        
        
        // right action
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(self.center.x+1, 1, self.center.x, frame.size.height-1)];
        _rightView.backgroundColor = [UIColor clearColor];
        
        UILabel *rightLabel = [[UILabel alloc] init];
        rightLabel.frame = CGRectMake(0, 0, 100, Name_Height);
        rightLabel.text = rightName;
        rightLabel.textAlignment = NSTextAlignmentCenter;
        rightLabel.textColor = [UIColor orangeColor];
        rightLabel.font = [UIFont systemFontOfSize:Name_Font];
        rightLabel.center = CGPointMake(frame.size.width/4,frame.size.height/2 + 10);
        [_rightView addSubview:rightLabel];
        
        
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.image = rightImage;
        _rightImageView.frame = CGRectMake(0, 0, 20, 20);
        _rightImageView.contentMode = UIViewContentModeScaleAspectFit;
        _rightImageView.center = CGPointMake(frame.size.width/4, frame.size.height/2-5);
        [_rightView addSubview:_rightImageView];
        
        
        [self addSubview:_rightView];
        
        _rightTap = [[UITapGestureRecognizer alloc] init];
        [_rightView addGestureRecognizer:_rightTap];
        
    }
    return self;
}

-(void)setMode:(BottomViewStyle)mode
{
    _mode = mode;
    
    if (_mode == BottomViewStyleOnlySave) {
        _rightView.hidden = YES;
        
        _verticalLine.hidden = YES;
        
        _leftView.frame = CGRectMake(0, 1, self.frame.size.width, self.frame.size.height);
        
        _leftLabel.center = CGPointMake(self.frame.size.width/2 ,self.frame.size.height/2+10);
        
        _leftImageView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-5);
    }
}

- (void)refreshView:(NSInteger )selectedNum
{
    if (0 == selectedNum) {
        _leftImageView.image = [UIImage imageNamed:@"ic_p3_delete_deselected"];
    }else
    {
        _leftImageView.image = [UIImage imageNamed:@"ic_p3_delete"];
    }
    
    if (1 == selectedNum) {
        _rightImageView.image = [UIImage imageNamed:@"ic_p3_save"];
        
    }else
    {
        _rightImageView.image = [UIImage imageNamed:@"ic_p3_save_deselected"];
    }
    
}

@end
