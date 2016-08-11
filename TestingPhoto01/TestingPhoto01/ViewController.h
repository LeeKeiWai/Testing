//
//  ViewController.h
//  TestingPhoto01
//
//  Created by Daniel Leung on 8/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) CustomNavigationController* nav;
+(ViewController*)getInstance;

@end

