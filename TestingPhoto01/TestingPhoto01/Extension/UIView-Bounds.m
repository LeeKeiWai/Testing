//
//  UIView-Bounds.m
//  K11Test
//
//  Created by Daniel Leung on 7/28/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import "UIView-Bounds.h"

@implementation UIView (Bounds)

-(float)top
{
    return self.frame.origin.y;
}

-(float)bottom
{
    return self.frame.origin.y+self.frame.size.height;
}

-(float)leading
{
    return self.frame.origin.x;
}

-(float)trailing
{
    return self.frame.origin.x+self.frame.size.width;
}

-(void)width:(float)value
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, value, self.frame.size.height);
}

-(void)height:(float)value
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, value);
}

-(float)width
{
    return self.frame.size.width;
}

-(float)height
{
    return self.frame.size.height;
}

@end
