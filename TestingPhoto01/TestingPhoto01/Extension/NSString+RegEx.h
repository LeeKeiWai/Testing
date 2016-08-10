//
//  NSString+RegEx.h
//  K11Test
//
//  Created by Daniel Leung on 7/11/16.
//  Copyright © 2016 web-on. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (RegEx)

- (NSString *)replacingWithPattern:(NSString *)pattern withTemplate:(NSString *)withTemplate error:(NSError **)error;
- (NSString*) filterTags;
- (BOOL) isValidEmail;

@end
