//
//  IGDignityViewController.m
//  iGig
//
//  Created by liuzhanying on 15/10/26.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGDignityViewController.h"
#import "IGFieldpaceViewController.h"
#import "IGHostViewController.h"
#import "IGBandViewController.h"
#import "IGFansViewController.h"

@interface IGDignityViewController ()
{
    UIButton *_selectedBtn;
}
@end

@implementation IGDignityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)createUI{
    UIImageView *bgImgView = [[UIImageView alloc] init];
    bgImgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 667/2);
    bgImgView.image = [UIImage imageNamed:@"login_bg"];
//    bgImgView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:bgImgView];

    
    UIImageView *logo = [[UIImageView alloc] init];
    UIImage *img = [UIImage imageNamed:@"login_logo"];
    logo.frame = CGRectMake(0, 15 + 64, SCREEN_WIDTH, img.size.height);
    logo.contentMode = UIViewContentModeScaleAspectFit;
    //    logo.backgroundColor = [UIColor redColor];
    logo.image = img;
    [self.view addSubview:logo];
    
    UILabel *label = [UITools createLabelWithFrame:CGRectMake(0, KGetViewBottomestYPosition(logo) + 20, SCREEN_WIDTH, 14) fontNumber:14 text:@"你的身份?"];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    UIImage *imgDisSelected = [UIImage imageNamed:@"registered_choice"];
    UIImage *imgSeleted = [UIImage imageNamed:@"registered_selected"];
    UIImage *imgSeparator = [UIImage imageNamed:@"registered_separator"];
    NSArray *nameArray = [NSArray arrayWithObjects:@"主办方", @"场地方", @"乐队", @"乐迷", nil];
    CGFloat maxY = 0;
    CGFloat startX = (SCREEN_WIDTH - imgSeleted.size.width * 4 - imgSeparator.size.width *3) / 2;
    for (int i=0 ; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(startX + (imgSeleted.size.width * i + imgSeparator.size.width * i), KGetViewBottomestYPosition(label)+22, imgSeleted.size.width, imgSeleted.size.height);
        
        btn.tag = i + 100;
        
        [btn setImage:imgDisSelected forState:UIControlStateNormal];
        [btn setImage:imgDisSelected forState:UIControlStateHighlighted];
        [btn setImage:imgSeleted forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(identifierBtn:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:btn];
        
        UILabel *nameLabel = [UITools createLabelWithFrame:CGRectMake(startX + (imgSeleted.size.width * i + imgSeparator.size.width * i) - 10, KGetViewBottomestYPosition(btn)+10, imgSeleted.size.width + 20, 14) fontNumber:14 text:nameArray[i]];
        [self.view addSubview:nameLabel];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.textColor = [UIColor whiteColor];
        
        if(i<3){
            UIImageView *line = [[UIImageView alloc] init];
            line.frame = CGRectMake((startX + imgSeleted.size.width) + (imgSeleted.size.width * i + imgSeparator.size.width * i) + 7 ,KGetViewBottomestYPosition(label)+22, imgSeleted.size.width, imgSeleted.size.height);
            line.image = imgSeparator;
            line.contentMode = UIViewContentModeScaleAspectFit;
            [self.view addSubview:line];
        }
        
        if(i == 3){
            btn.selected = YES;
            _selectedBtn = btn;
            maxY = KGetViewBottomestYPosition(nameLabel);
        }
        
    }
    
    UIImage *btnImg = [UIImage imageNamed:@"login_button"];
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    nextBtn.frame = CGRectMake((SCREEN_WIDTH - btnImg.size.width) / 2, maxY + 25, btnImg.size.width, btnImg.size.height);
    [nextBtn setBackgroundImage:btnImg forState:UIControlStateNormal];
    
    UILabel *nextLabel = [UITools createLabelWithFrame:CGRectMake((SCREEN_WIDTH - btnImg.size.width) / 2 + 10, maxY + 22, btnImg.size.width, btnImg.size.height) fontNumber:14 text:@"继续"];
    nextLabel.textColor = [UIColor whiteColor];
    
    [nextBtn addTarget:self action:@selector(nextBtn) forControlEvents:UIControlEventTouchUpInside];
//    nextBtn.tag = i + Btn_Tag_Start;
    [self.view addSubview:nextBtn];
    [self.view addSubview:nextLabel];

    
}

- (void)nextBtn{
    if(_selectedBtn.tag - 100 == 0){
        //主办方跳转
        IGHostViewController *vc = [[IGHostViewController alloc] init];
        vc.phone = self.phone;
        [self.navigationController pushViewController:vc animated:YES];
    }else if(_selectedBtn.tag - 100 == 1){
        //场地方跳转
        IGFieldpaceViewController *vc = [[IGFieldpaceViewController alloc] init];
        vc.phone = self.phone;
        [self.navigationController pushViewController:vc animated:YES];
    }else if(_selectedBtn.tag - 100 == 2){
        //乐队跳转
        IGBandViewController *vc = [[IGBandViewController alloc] init];
        vc.phone = self.phone;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (_selectedBtn.tag - 100 == 3){
        //乐迷
        IGFansViewController *vc = [[IGFansViewController alloc] init];
        vc.phone = self.phone;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)identifierBtn:(UIButton *)btn{
    if(_selectedBtn == btn){
        return;
    }
    btn.selected = YES;
    _selectedBtn.selected = NO;
    _selectedBtn = btn;
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
