//
//  EditViewController.m
//  TestingPhoto01
//
//  Created by Daniel Leung on 8/11/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view randomColor];
    
    
}

-(void)updateUI:(NSDictionary*)dic
{
    NSString* assetId = [dic objectForKey:@"assetId"];
    
    PHFetchResult *assets = [PHAsset fetchAssetsWithLocalIdentifiers:@[assetId] options:nil];
    
    NSLog(@"%lu",assets.count);
    
    [assets enumerateObjectsUsingBlock:^(PHAsset *asset, NSUInteger idx, BOOL *stop) {

        [[PHCachingImageManager defaultManager] requestImageForAsset:asset
                                targetSize:PHImageManagerMaximumSize
                               contentMode:PHImageContentModeAspectFill
                                   options:nil
                             resultHandler:^(UIImage *result, NSDictionary *info) {
                                 
                                 NSLog(@"%f",result.size.width);
                                 
                                 UIImageView* iv = [[UIImageView alloc] initWithImage:result];
                                 [self.view addSubview:iv];
                                 iv.frame = self.view.frame;
                                 iv.contentMode = UIViewContentModeScaleAspectFill;
                                 iv.clipsToBounds = YES;

                             }];
        
    }];

    
//    PHCachingImageManager* manager = [[PHCachingImageManager alloc] init];
//    [imageManager requestImageForAsset:asset1
//                            targetSize:CGSizeMake([Config width]/4, [Config width]/4)
//                           contentMode:PHImageContentModeAspectFill
//                               options:nil
//                         resultHandler:^(UIImage *result, NSDictionary *info) {
//                             
//                             if ([cell.representedAssetIdentifierArr containsObject:asset1.localIdentifier]) {
//                                 cell.photo1.image = result;
//                                 cell.photo1.userInteractionEnabled = YES;
//                             }
//                         }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
