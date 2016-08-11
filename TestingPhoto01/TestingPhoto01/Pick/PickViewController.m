//
//  PickViewController.m
//  TestingPhoto01
//
//  Created by Daniel Leung on 8/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "PickViewController.h"


@interface PickViewController ()

@end

@implementation PickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //[self.view randomColor];
    
    self.automaticallyAdjustsScrollViewInsets = false;
    
    imageManager = [[PHCachingImageManager alloc] init];
    
    PHFetchOptions *allPhotosOptions = [[PHFetchOptions alloc] init];
    allPhotosOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
    allPhotos = [PHAsset fetchAssetsWithOptions:allPhotosOptions];

    tableView01 = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView01.dataSource = self;
    tableView01.delegate = self;
    [self.view addSubview:tableView01];
    [tableView01 setContentOffset:CGPointMake(0, tableView01.contentSize.height) animated:YES];
    

}

-(void)viewDidAppear:(BOOL)animated
{
    CGFloat yOffset = 0;
    if (tableView01.contentSize.height > tableView01.bounds.size.height) {
        yOffset = tableView01.contentSize.height - tableView01.bounds.size.height;
    }
    [tableView01 setContentOffset:CGPointMake(0, yOffset) animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return [Config width]/4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ceil(allPhotos.count/4.0f);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    PickCell *cell = (PickCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[PickCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        NSLog(@"nil");
    }

    [cell randomColor];

    //PHImageRequestOptions* opts = [PHImageRequestOptions new];
    //opts.resizeMode = PHImageRequestOptionsResizeModeExact;
    //opts.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    
    cell.photo1.userInteractionEnabled = NO;
    cell.photo2.userInteractionEnabled = NO;
    cell.photo3.userInteractionEnabled = NO;
    cell.photo4.userInteractionEnabled = NO;
    
    int currentIndex = (int)indexPath.row * 4;
    int photo1 = currentIndex;
    int photo2 = currentIndex+1;
    int photo3 = currentIndex+2;
    int photo4 = currentIndex+3;
    
    PHAsset *asset1 = allPhotos[photo1];
    PHAsset *asset2 = photo2 >= allPhotos.count ? NULL : allPhotos[photo2];
    PHAsset *asset3 = photo3 >= allPhotos.count ? NULL : allPhotos[photo3];
    PHAsset *asset4 = photo4 >= allPhotos.count ? NULL : allPhotos[photo4];
    
    cell.representedAssetIdentifierArr = @[
                                           asset1.localIdentifier,
                                           asset2 ? asset2.localIdentifier : @"",
                                           asset3 ? asset3.localIdentifier : @"",
                                           asset4 ? asset4.localIdentifier : @""];
    
//    cell.representedAssetIdentifierSet = [NSSet setWithObjects:
//                                          asset1.localIdentifier,
//                                          asset2 ? asset2.localIdentifier : @"",
//                                          asset3 ? asset3.localIdentifier : @"",
//                                          asset4 ? asset4.localIdentifier : @"",
//                                          nil];
    
    [imageManager requestImageForAsset:asset1
                                 targetSize:CGSizeMake([Config width]/4, [Config width]/4)
                                contentMode:PHImageContentModeAspectFill
                                    options:nil
                              resultHandler:^(UIImage *result, NSDictionary *info) {
                                  
                                  if ([cell.representedAssetIdentifierArr containsObject:asset1.localIdentifier]) {
                                      cell.photo1.image = result;
                                      cell.photo1.userInteractionEnabled = YES;
                                  }
                              }];
    
    [imageManager requestImageForAsset:asset2
                            targetSize:CGSizeMake([Config width]/4, [Config width]/4)
                           contentMode:PHImageContentModeAspectFill
                               options:nil
                         resultHandler:^(UIImage *result, NSDictionary *info) {
                             if ([cell.representedAssetIdentifierArr containsObject:asset1.localIdentifier]) {
                                 cell.photo2.image = result;
                                 cell.photo2.userInteractionEnabled = YES;
                             }
                         }];
    
    [imageManager requestImageForAsset:asset3
                            targetSize:CGSizeMake([Config width]/4, [Config width]/4)
                           contentMode:PHImageContentModeAspectFill
                               options:nil
                         resultHandler:^(UIImage *result, NSDictionary *info) {
                             if ([cell.representedAssetIdentifierArr containsObject:asset1.localIdentifier]) {
                                 cell.photo3.image = result;
                                 cell.photo3.userInteractionEnabled = YES;
                             }
                         }];
    
    [imageManager requestImageForAsset:asset4
                            targetSize:CGSizeMake([Config width]/4, [Config width]/4)
                           contentMode:PHImageContentModeAspectFill
                               options:nil
                         resultHandler:^(UIImage *result, NSDictionary *info) {
                             if ([cell.representedAssetIdentifierArr containsObject:asset1.localIdentifier]) {
                                 cell.photo4.image = result;
                                 cell.photo4.userInteractionEnabled = YES;
                             }
                         }];
    
    return cell;
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
