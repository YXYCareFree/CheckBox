//
//  ViewController.m
//  YXYCheckBoxView
//
//  Created by 杨肖宇 on 2018/2/8.
//  Copyright © 2018年 yxy. All rights reserved.
//

#import "ViewController.h"
#import "YXYCheckBoxView.h"

#define COLOR_MAIN                 colorFromHexString(@"0193de")
#define COLOR_BORDER               colorFromHexString(@"bbbbbb")

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YXYCheckBoxView *roundBox;
@property (weak, nonatomic) IBOutlet YXYCheckBoxView *squareBox;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.roundBox.isRound = YES;
    self.roundBox.isSelected = YES;
    self.squareBox.borderColor = self.roundBox.borderColor = COLOR_BORDER;
    self.roundBox.fillColor = self.squareBox.fillColor = COLOR_MAIN;
    self.squareBox.image = self.roundBox.image = [UIImage imageNamed:@"correct"];
}



static inline UIColor * colorFromHexString(NSString * colorHex){
    
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:colorHex];
    //[scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


@end
