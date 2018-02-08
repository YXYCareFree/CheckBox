//
//  CheckBoxView.h
//  Search
//
//  Created by 杨肖宇 on 2018/2/7.
//  Copyright © 2018年 yxy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BoxType) {
    SquareType,
    Round
};

//IB_DESIGNABLE
@interface YXYCheckBoxView : UIView

/**
 边框的颜色
 */
@property (nonatomic, strong) UIColor * borderColor;
/**
 选中状态下的填充颜色
 */
@property (nonatomic, strong) UIColor * fillColor;

/**
 选中状态下的图片
 */
@property (nonatomic, strong) UIImage * image;

/**
 是否被选中， 默认为NO
 */
@property (nonatomic, assign) BOOL isSelected;

/**
 选择框是否为圆形，默认NO为□, YES为○
 */
@property (nonatomic, assign) BOOL isRound;

@end
