//
//  IGCustInfoView.m
//  iGig
//
//  Created by duanzd on 15/10/29.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGCustInfoView.h"

@implementation IGCustInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self createSubViews];
//        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)createSubViews{
    UIView *headView = [UITools createViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 20, 70) backgroundColor:UIColorFromRGB(0xadadad, 1)];
    [self addSubview:headView];
    headView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(custInfoTap:)];
    [headView addGestureRecognizer:tapGes];
    
    UIImageView *imgCust = [[UIImageView alloc] init];
    [imgCust setImageWithURL:[NSURL URLWithString:[IGCustData sharedInstance].headPic] placeholderImage:[UIImage imageNamed:@"1"]];
    imgCust.layer.borderWidth = 0.5f;
    imgCust.layer.borderColor = UIColorFromRGB(0xA0B9C2, 1).CGColor;
    imgCust.frame = CGRectMake(10, 10, 50 , 50);
    imgCust.layer.cornerRadius = 50/2;
    imgCust.layer.masksToBounds = YES;
    [headView addSubview:imgCust];
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.frame = CGRectMake(KGetViewRightestXPosition(imgCust)+10, 20, 200, 12);
    nameLabel.text = [IGCustData sharedInstance].username;
    nameLabel.font = [UIFont systemFontOfSize:12];
    [headView addSubview:nameLabel];
    
    UILabel *adressLabel = [[UILabel alloc] init];
    adressLabel.frame = CGRectMake(KGetViewRightestXPosition(imgCust)+10, KGetViewBottomestYPosition(nameLabel)+5, 200, 10);
    adressLabel.font = [UIFont systemFontOfSize:10];
    adressLabel.text = [IGCustData sharedInstance].address;
    [headView addSubview:adressLabel];
    
    
    UILabel *custType = [[UILabel alloc] init];
    custType.frame = CGRectMake(SCREEN_WIDTH - 110, KGetViewBottomestYPosition(nameLabel)+5, 80, 10);
    [headView addSubview:custType];
    switch ([[IGCustData sharedInstance].type intValue]) {
        case 1:
            custType.text = @"场地方";
            break;
        case 2:
            custType.text = @"主办方";
            break;
        case 3:
            custType.text = @"乐队";
            break;
        case 4:
            custType.text = @"乐迷";
            break;
            
        default:
            break;
    }
    custType.font = [UIFont systemFontOfSize:10];
    custType.textAlignment = NSTextAlignmentRight;
    
    UIView *footView = [UITools createViewWithFrame:CGRectMake(0, 70, SCREEN_WIDTH - 20, 30) backgroundColor:UIColorFromRGB(0xCBCBCB, 1)];
    [self addSubview:footView];
    
//    //分别表示评论数 关注数 被关注数
    NSArray *custNumber = [NSArray arrayWithObjects:@"评论 ", @"关注 ", @"被专注 ", nil];
//    CGFloat space = (SCREEN_WIDTH - 20 - 150)/2;
//    for (int i=0; i<3; i++){
//        UILabel *label = [UITools createLabelWithFrame:CGRectMake(10 + ((45+space) * i), 0, 45, 30) fontcNumber:10 text:custNumber[i]];
//        
//        [footView addSubview:label];
//
//    }
    
    UILabel *label1 = [UITools createLabelWithFrame:CGRectMake(10 + 10, 0, 55, 30) fontNumber:10 text:[custNumber[0] stringByAppendingString:[IGCustData sharedInstance].commentNum]];
    [footView addSubview:label1];
    
//    [IGCustData sharedInstance].followNum
    UILabel *label2 = [UITools createLabelWithFrame:CGRectMake(65, 0, SCREEN_WIDTH - 20 - 130, 30) fontNumber:10 text:[custNumber[1] stringByAppendingString:[IGCustData sharedInstance].followNum]];
    label2.textAlignment = NSTextAlignmentCenter;
    [footView addSubview:label2];
    
    UILabel *label3 = [UITools createLabelWithFrame:CGRectMake(SCREEN_WIDTH - 20 - 110 , 0, 100, 30) fontNumber:10 text:[custNumber[2] stringByAppendingString:[IGCustData sharedInstance].followedNum]];
    label3.textAlignment = NSTextAlignmentRight;
    [footView addSubview:label3];
    
    
}

- (void)custInfoTap:(UITapGestureRecognizer *)ges{
    if([self.delegate respondsToSelector:@selector(custInfoViewDidSeleted)]){
        [self.delegate custInfoViewDidSeleted];
    }
}

@end
