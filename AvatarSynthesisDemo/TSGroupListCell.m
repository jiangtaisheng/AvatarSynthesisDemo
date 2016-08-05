//
//  TSGroupListCell.m
//  AvatarSynthesisDemo
//
//  Created by apple2015 on 16/8/4.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "TSGroupListCell.h"
@interface TSGroupListCell ()
@end
@implementation TSGroupListCell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static   NSString * ID=@"TSGroupListCell";
    
    TSGroupListCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        
        cell=[[TSGroupListCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self createUI];
    }

    return self;
}

- (void)createUI
{
  
//    self.imageView.frame=CGRectMake(10, 10, 36, 36);
//    self.textLabel.frame=CGRectMake(CGRectGetMaxX(self.imageView.frame)+10, 10, 200, 20);

}


- (void)layoutSubviews
{

    NSLog(@"%@",[NSValue valueWithCGRect:self.imageView.frame]);
    
    self.imageView.frame=CGRectMake(15,0,36, 36);
    self.textLabel.frame=CGRectMake(CGRectGetMaxX(self.imageView.frame)+10, 10, 200, 20);


}
@end
