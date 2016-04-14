//
//  BandCell.m
//  iGig
//
//  Created by duanzd on 15/11/8.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "BandCell.h"
#import "AddBandModel.h"
//#import ""

@interface BandCell ()

@property (nonatomic, strong) UIImageView *picView;

@property (nonatomic, strong) UILabel *message;
@property (nonatomic, strong) UIImageView *selectedImg;


@end

@implementation BandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self createSubViews];
        self.backgroundColor = UIColorFromRGB(0xCBCBCB, 1);
    }
    return self;
}

- (void)createSubViews{
    self.picView = [[UIImageView alloc] init];
    self.picView.frame = CGRectMake(20, 10, 50, 50);
    self.picView.layer.masksToBounds = YES;
    self.picView.layer.cornerRadius = 25;
    [self addSubview:self.picView];
    
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(KGetViewRightestXPosition(self.picView)+12, 20, 200, 15)];
    self.name.font = [UIFont systemFontOfSize:15];

    [self addSubview:self.name];
    
    self.message = [[UILabel alloc] initWithFrame:CGRectMake(KGetViewRightestXPosition(self.picView)+12, KGetViewBottomestYPosition(self.name)+5, 200, 11)];
    self.message.font = [UIFont systemFontOfSize:11];

    [self addSubview:self.message];
    
    UIImage *img = [UIImage imageNamed:@"Not selected"];
    UIImage *img1 = [UIImage imageNamed:@"Selected"];
    self.selectedImg = [[UIImageView alloc] init];
    self.selectedImg.frame = CGRectMake(SCREEN_WIDTH - 20 - 20 - img.size.width, 0, img.size.width, 70);
    self.selectedImg.contentMode = UIViewContentModeScaleAspectFit;
    self.selectedImg.image = img;
    [self addSubview:self.selectedImg];
    
    __weak BandCell *mSelf = self;
    self.imgChanged = ^ (BOOL isSelected){
        if(isSelected){
            mSelf.selectedImg.image = img1;
        }else{
            mSelf.selectedImg.image = img;
        }
    };
    
    UIView *line = [UITools createViewWithFrame:CGRectMake(0, 69, SCREEN_WIDTH - 20, 1) backgroundColor:UIColorFromRGB(0x585858, 1)];
    [self addSubview:line];
    
}

- (void)setModel:(AddBandModel *)model{
    self.message.text = model.sign;
    self.name.text = model.username;
    [self.picView setImageWithURL:[NSURL URLWithString:model.headpic] placeholderImage:[UIImage imageNamed:@"1"]];
    self.bandId = model.bandId;

}

@end
