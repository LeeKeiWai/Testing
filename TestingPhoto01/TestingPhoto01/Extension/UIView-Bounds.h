//
//  UIView-Bounds.h
//  K11Test
//
//  Created by Daniel Leung on 7/28/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (Bounds)

-(float)top;
-(float)bottom;
-(float)leading;
-(float)trailing;
-(void)width:(float)value;
-(void)height:(float)value;
-(float)width;
-(float)height;

@end
