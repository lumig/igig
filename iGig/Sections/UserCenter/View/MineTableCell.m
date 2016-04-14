//
//  MineTableCell.m
//  iGig
//
//  Created by duanzd on 15/10/29.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "MineTableCell.h"

@interface MineTableCell ()



@end

@implementation MineTableCell



- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        self.backgroundColor = UIColorFromRGB(0xADADAD, 1);
        
        _titleLabel = [[UILabel alloc] init];
        [self addSubview:_titleLabel];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.frame = CGRectMake(10, 0, 50, 44);
        
        UIImage *img = [UIImage imageNamed:@"public_next"];
        UIImageView *next = [[UIImageView alloc] init];
        next.image = img;
        [self addSubview:next];
        next.frame = CGRectMake(SCREEN_WIDTH - 20 - 15 - img.size.width, 0, img.size.width, 44);
        next.contentMode = UIViewContentModeScaleAspectFit;
        
        UIImageView *line = [[UIImageView alloc] init];
        line.frame = CGRectMake(0, 43, SCREEN_WIDTH - 20, 1);
        [self addSubview:line];
        line.backgroundColor = UIColorFromRGB(0xB8B8B8, 1);
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    MineTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineTableCell"];
    if(nil == cell){
        cell = [[MineTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MineTableCell"];
    }
    
    return cell;
}
@end
