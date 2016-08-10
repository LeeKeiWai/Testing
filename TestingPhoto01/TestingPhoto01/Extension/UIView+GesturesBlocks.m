//
//  UIView+GesturesBlocks.m
//  K11Test
//
//  Created by Kelvin Lee on 8/1/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import "UIView+GesturesBlocks.h"

@implementation UIView (GesturesBlocks)

- (void)addTapGestureWithBlock:(EmptyBlock)block
{
    objc_setAssociatedObject(self, &UIViewBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(callBlock:)];
    [self addGestureRecognizer:singleFingerTap];
}

- (void)callBlock:(id)sender {
    EmptyBlock block = (EmptyBlock)objc_getAssociatedObject(self, &UIViewBlockKey);
    if (block) block();
}

@end
