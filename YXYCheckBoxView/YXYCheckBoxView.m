//
//  CheckBoxView.m
//  Search
//
//  Created by 杨肖宇 on 2018/2/7.
//  Copyright © 2018年 yxy. All rights reserved.
//

#import "YXYCheckBoxView.h"

@implementation YXYCheckBoxView{
    CAShapeLayer * _layer;
    UIImageView * _selectedImageView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self configSettings];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    CGFloat h = frame.size.height;
    CGFloat w = frame.size.width;
    NSAssert((h == w), @"CheckBoxView init. The width and height must be equal ");
    if (self = [super initWithFrame:frame]) {
        [self configSettings];
    }
    return self;
}

- (void)configSettings{
    _isRound = NO;
    _isSelected = NO;
    _fillColor = [UIColor redColor];
    _borderColor = [UIColor redColor];
    self.layer.borderColor = _borderColor.CGColor;
    self.layer.borderWidth = 1;
}

- (void)setIsRound:(BOOL)isRound{
    _isRound = isRound;
    self.layer.masksToBounds = isRound;
    if (_isRound) {
        self.layer.cornerRadius = self.frame.size.height / 2;
    }
    [self setSelectedState];
}

- (void)setFillColor:(UIColor *)fillColor{
    _fillColor = fillColor;
    [self setSelectedState];
}

- (void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.layer.borderColor = _borderColor.CGColor;
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (self.isSelected) {
        [self setSelectedState];
#warning 此处去重置_selectedImageView.image会导致_selectedImageView显示不出来
        if (_selectedImageView) {
            [_selectedImageView removeFromSuperview];
            _selectedImageView = nil;
        }
        _selectedImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _selectedImageView.image = self.image;
        [self addSubview:_selectedImageView];
    }else{
        _layer.fillColor = [UIColor whiteColor].CGColor;
        [_selectedImageView removeFromSuperview];
        _selectedImageView = nil;
    }
}

- (void)setImage:(UIImage *)image{
    _image = image;
    _selectedImageView.image = _image;
    [self setIsSelected:self.isSelected];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.isSelected = !self.isSelected;
}
#pragma mark-- 填充颜色
- (void)setSelectedState{
    if (self.isSelected) {
        if (_layer) {
            _layer.fillColor = _fillColor.CGColor;
            [self.layer addSublayer:_layer];
        }else{
            UIBezierPath * path = [UIBezierPath bezierPathWithRect:self.bounds];
            CAShapeLayer * layer = [CAShapeLayer layer];
            layer.fillColor = _fillColor.CGColor;
            layer.path = path.CGPath;
            _layer = layer;
            [self.layer addSublayer:layer];
            _selectedImageView = [[UIImageView alloc] initWithFrame:self.bounds];
            [self addSubview:_selectedImageView];
        }
    }
}

@end
