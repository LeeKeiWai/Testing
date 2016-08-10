//
//  UIView+RandomColor.m
//  K11Test
//
//  Created by Daniel Leung on 7/28/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import "UIView-RandomColor.h"
#import <UIKit/UIKit.h>
#import "UIColor+Random.h"

@implementation UIView (RandomColor)

/* for debug use */
-(void)randomColor
{
    self.backgroundColor = [UIColor random];
    self.layer.borderColor = [UIColor random].CGColor;
    self.layer.borderWidth = 3;
}

-(void)randomBGColor
{
    self.backgroundColor = [UIColor random];
}

-(void)randomBorderColor
{
    self.layer.borderColor = [UIColor random].CGColor;
    self.layer.borderWidth = 3;
}

@end
