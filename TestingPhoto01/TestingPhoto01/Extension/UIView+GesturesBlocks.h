//
//  UIView+GesturesBlocks.h
//  K11Test
//
//  Created by Kelvin Lee on 8/1/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

typedef void (^EmptyBlock)();
static char UIViewBlockKey;

@interface UIView (GesturesBlocks)

- (void)addTapGestureWithBlock:(EmptyBlock)block;
- (void)callBlock:(id)sender;

@end
