//
//  PickCell.m
//  TestingPhoto01
//
//  Created by Daniel Leung on 8/10/16.
//  Copyright © 2016 test. All rights reserved.
//

#import "PickCell.h"

@implementation PickCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        float width = [Config width]/4;
        
        self.photo1 = [[UIImageView alloc] init];
        self.photo1.frame = CGRectMake(0, 0, width, width);
        [self.contentView addSubview:self.photo1];
        [self.photo1 randomColor];
        self.photo1.contentMode = UIViewContentModeScaleAspectFill;
        self.photo1.clipsToBounds = YES;
        
        self.photo2 = [[UIImageView alloc] init];
        self.photo2.frame = CGRectMake(0+width, 0, width, width);
        [self.contentView addSubview:self.photo2];
        [self.photo2 randomColor];
        self.photo2.contentMode = UIViewContentModeScaleAspectFill;
        self.photo2.clipsToBounds = YES;
        
        self.photo3 = [[UIImageView alloc] init];
        self.photo3.frame = CGRectMake(0+width*2, 0, width, width);
        [self.contentView addSubview:self.photo3];
        [self.photo3 randomColor];
        self.photo3.contentMode = UIViewContentModeScaleAspectFill;
        self.photo3.clipsToBounds = YES;
        
        self.photo4 = [[UIImageView alloc] init];
        self.photo4.frame = CGRectMake(0+width*3, 0, width, width);
        [self.contentView addSubview:self.photo4];
        [self.photo4 randomColor];
        self.photo4.contentMode = UIViewContentModeScaleAspectFill;
        self.photo4.clipsToBounds = YES;
        
        UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.photo1 addGestureRecognizer:singleFingerTap];
        singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.photo2 addGestureRecognizer:singleFingerTap];
        singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.photo3 addGestureRecognizer:singleFingerTap];
        singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        [self.photo4 addGestureRecognizer:singleFingerTap];
        
        self.photo1.tag = 0;
        self.photo2.tag = 1;
        self.photo3.tag = 2;
        self.photo4.tag = 3;
        
    }
    return self;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    NSString* assetId = self.representedAssetIdentifierArr[recognizer.view.tag];
    NSLog(@"assetId - %@",assetId);
    
    EditViewController* edit = [EditViewController new];
    [edit updateUI:@{@"assetId":assetId}];
    [[ViewController getInstance].nav pushViewController:edit animated:YES];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
