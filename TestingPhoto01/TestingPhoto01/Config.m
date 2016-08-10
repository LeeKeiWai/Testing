//
//  Config.m
//  K11Test
//
//  Created by Daniel Leung on 6/27/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import "Config.h"

@implementation Config

+(float)width
{
    return [UIScreen mainScreen].bounds.size.width;
}

+(float)height
{
    return [UIScreen mainScreen].bounds.size.height;
}

+(float)statusH
{
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

@end
