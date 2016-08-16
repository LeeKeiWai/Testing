//
//  MyViewController.m
//  Painter
//
//  Created by Daniel Leung on 8/15/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(id)initWithCoder:(NSCoder *)coder
{
    NSRect theRect = [coder decodeRectForKey:@"frame"];
    self = [super initWithFrame:theRect];
    return self;
}

-(void)mouseDown:(NSEvent *)pTheEvent {
    NSLog(@"mouseDown");
} // end mouseDown

-(void)mouseDragged:(NSEvent *)pTheEvent {
    NSLog(@"mouseDragged");
} // end mouseDragged

-(void)mouseUp:(NSEvent *)pTheEvent {
    NSLog(@"mouseUp");
} // end mouseUp

- (void)drawRect:(NSRect)rect {
    [[NSColor blueColor] set];
    NSBezierPath *newPath = [NSBezierPath bezierPathWithRect:[self bounds]];
    [newPath fill];
}

@end
