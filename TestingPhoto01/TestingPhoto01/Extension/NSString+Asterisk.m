//
//  NSString+Asterisk.m
//  K11Test
//
//  Created by Daniel Leung on 7/12/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import "NSString+Asterisk.h"

@implementation NSString (Asterisk)

- (NSString*) addAsteriskToEnd
{
    return [NSString stringWithFormat:@"%@ *",self];
}

@end
