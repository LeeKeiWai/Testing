//
//  PickViewController.h
//  TestingPhoto01
//
//  Created by Daniel Leung on 8/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "PickCell.h"

@interface PickViewController : UIViewController
{
    UITableView* tableView01;
    NSMutableArray* list;
    PHFetchResult *allPhotos;
    PHCachingImageManager *imageManager;
}

@end
