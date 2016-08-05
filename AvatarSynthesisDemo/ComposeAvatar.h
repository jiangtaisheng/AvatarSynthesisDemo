//
//  ComposeAvatar.h
//  XLXBadmintoon
//
//  Created by apple2015 on 16/3/22.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ComposeAvatar : NSObject
@property(nonatomic,strong)    NSMutableArray * avaterArr;

-(void)AchieveGroupAvaterForavaterArray:(NSMutableArray *)avaterArray withSuperViewW:(CGFloat)superViewW complationHandle:(void (^)(UIView *imageV))completion;

@end
