//
//  PickCell.h
//  TestingPhoto01
//
//  Created by Daniel Leung on 8/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickCell : UITableViewCell

@property (nonatomic, strong) UIImageView *photo1;
@property (nonatomic, strong) UIImageView *photo2;
@property (nonatomic, strong) UIImageView *photo3;
@property (nonatomic, strong) UIImageView *photo4;

@property (nonatomic, strong) NSString *representedAssetIdentifier;
@property (nonatomic, strong) NSSet *representedAssetIdentifierSet;
@property (nonatomic, strong) NSArray *representedAssetIdentifierArr;

@end
