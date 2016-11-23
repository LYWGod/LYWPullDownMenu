//
//  YZMenuButton.m
//  PullDownMenu
//
//  Created by yz on 16/8/12.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "LYWMenuButton.h"
#import "UIView+LYWCategory.h"

@implementation LYWMenuButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.imageView.x < self.titleLabel.x) {
        
        self.titleLabel.x = self.imageView.x;
        
        self.imageView.x = self.titleLabel.maxX + 10;
    }
    
    
    
}

@end
