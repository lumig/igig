//
//  IGTableVIewCell.m
//  iGig
//
//  Created by liuzhanying on 15/10/21.
//  Copyright © 2015年 longlz. All rights reserved.
//

#import "IGTableVIewCell.h"

@implementation IGTableVIewCell

- (void)setModel:(IGHomeModel *)model{
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    NSString *cellID = @"IGTableVIewCell";
    IGTableVIewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(nil == cell){
        cell = [[IGTableVIewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.backgroundColor = UIColorFromRGB(0x939393, 1);
    [cell setSelectionStyle:0];
    return cell;
}

@end
