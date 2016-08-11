//
//  ViewController.m
//  TestingPhoto01
//
//  Created by Daniel Leung on 8/9/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>
#import "PickViewController.h"

@interface ViewController ()

@end

@implementation ViewController

static ViewController* me;

+(ViewController*)getInstance
{
    return me;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    me = self;
    
    self.nav = [[CustomNavigationController alloc] init];
    [self addChildViewController:self.nav];
    [self.view addSubview:self.nav.view];
    [self.nav didMoveToParentViewController:self];
    self.nav.navigationBarHidden = YES;
    PickViewController* pick = [PickViewController new];
    self.nav.viewControllers = @[pick];
    
    
//    PHFetchOptions *allPhotosOptions = [[PHFetchOptions alloc] init];
//    allPhotosOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
//    PHFetchResult *allPhotos = [PHAsset fetchAssetsWithOptions:allPhotosOptions];
//    
//    NSLog(@"allPhotos.count - %lu",(unsigned long)allPhotos.count);
//    
//    PHAsset *asset = allPhotos[0];
//    
//    PHAssetMediaType type           = asset.mediaType;
//    PHAssetMediaSubtype subType     = asset.mediaSubtypes;
//    
//    PHCachingImageManager *imageManager = [[PHCachingImageManager alloc] init];
//
//    // Request an image for the asset from the PHCachingImageManager.
//    [imageManager requestImageForAsset:asset
//                                 targetSize:CGSizeMake(100, 100)
//                                contentMode:PHImageContentModeAspectFill
//                                    options:nil
//                              resultHandler:^(UIImage *result, NSDictionary *info) {
//                                  // Set the cell's thumbnail image if it's still showing the same asset.
//                                  //if ([cell.representedAssetIdentifier isEqualToString:asset.localIdentifier]) {
//                                  //    cell.thumbnailImage = result;
//                                  //}
//                                  
//                                  NSLog(@"- %f",result.size.height);
//                                  
//                                  UIImageView* iv = [[UIImageView alloc] initWithImage:result];
//                                  [self.view addSubview:iv];
//                                  iv.frame = CGRectMake(iv.frame.size.width, iv.frame.size.height, iv.frame.size.width, iv.frame.size.height);
//
//                                  
//                              }];
    
//    typedef NS_ENUM(NSInteger, PHAssetMediaType) {
//        PHAssetMediaTypeUnknown = 0,
//        PHAssetMediaTypeImage   = 1,
//        PHAssetMediaTypeVideo   = 2,
//        PHAssetMediaTypeAudio   = 3,
//    } NS_ENUM_AVAILABLE_IOS(8_0);
    
//    typedef NS_OPTIONS(NSUInteger, PHAssetMediaSubtype) {
//        PHAssetMediaSubtypeNone               = 0,
//        
//        // Photo subtypes
//        PHAssetMediaSubtypePhotoPanorama      = (1UL << 0),
//        PHAssetMediaSubtypePhotoHDR           = (1UL << 1),
//        PHAssetMediaSubtypePhotoScreenshot NS_AVAILABLE_IOS(9_0) = (1UL << 2),
//        PHAssetMediaSubtypePhotoLive NS_AVAILABLE_IOS(9_1) = (1UL << 3),
//        
//        
//        // Video subtypes
//        PHAssetMediaSubtypeVideoStreamed      = (1UL << 16),
//        PHAssetMediaSubtypeVideoHighFrameRate = (1UL << 17),
//        PHAssetMediaSubtypeVideoTimelapse     = (1UL << 18),
//    } NS_AVAILABLE_IOS(8_0);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
