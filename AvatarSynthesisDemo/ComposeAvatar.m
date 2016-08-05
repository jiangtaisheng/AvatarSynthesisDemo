//
//  ComposeAvatar.m
//  XLXBadmintoon
//
//  Created by apple2015 on 16/3/22.
//  Copyright © 2016年 com.xile. All rights reserved.
//

#import "ComposeAvatar.h"
#import "UIImageView+WebCache.h"
#import "SDImageCache.h"
#define COMBINED_HEAD_TAG 45678

const CGFloat marginSpaceRatio = 27.0;

@interface ComposeAvatar ()
{
    CGFloat _cellImageViewchrSideLength;
    CGFloat _margin;
    NSMutableArray *_imageViewsFrames;
    void (^_completion)(UIView *imageV);
    int _compleCount;
}

@end

@implementation ComposeAvatar



-(void)AchieveGroupAvaterForavaterArray:(NSMutableArray *)avaterArray withSuperViewW:(CGFloat)superViewW complationHandle:(void (^)(UIView *imageV))completion
{
    _completion = completion;
    _imageViewsFrames = [NSMutableArray array];
    _avaterArr=[NSMutableArray arrayWithCapacity:0];
    [_avaterArr setArray:avaterArray];
    
    //异步操作代码块
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        //设置图片元素的坐标，存储到了数组_imageViewsFrames
        [self stitchingOnImageView:superViewW withImagescount:_avaterArr.count];
        [self makeGroupAvatar:_avaterArr withSuperViewW:superViewW];
    
    });
}

- (void)makeGroupAvatar: (NSMutableArray *)imageArray withSuperViewW:(CGFloat)superViewW
{
    //数组为空，退出函数
    if ([imageArray count] == 0) {
        if (_completion) {
            _completion(nil);
        }
        return;
    }
    //    设置背景灰色图
    UIView *groupAvatarView = [[UIView alloc]initWithFrame:CGRectMake(0,0,superViewW,superViewW)];
    groupAvatarView.backgroundColor =[UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1];
    for (int i = 0; i < [imageArray count]; i++){
        UIImageView *tempImageView = [[UIImageView alloc]initWithFrame:[[_imageViewsFrames objectAtIndex:i]CGRectValue]];
        NSURL *url1 = [NSURL URLWithString:imageArray[i]];
        
        [tempImageView sd_setImageWithURL:url1 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            _compleCount++;
            [tempImageView setImage:image];
            
            [groupAvatarView addSubview:tempImageView];
            
            if (_compleCount==imageArray.count && _completion) {
                groupAvatarView.tag = COMBINED_HEAD_TAG;
                _completion(groupAvatarView);
            }
            
        }];
    }
}

- (void)stitchingOnImageView:(CGFloat)superViewW withImagescount:(NSInteger)count
{
    _margin = superViewW / marginSpaceRatio;
    
    [self generateImageViewSideLengthWithCanvasView:superViewW byImageViewsCount:count];
    
    switch (count) {
        case 1: {
            CGRect imgRect = CGRectMake((superViewW-_cellImageViewchrSideLength)/2.0, (superViewW-_cellImageViewchrSideLength)/2.0, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
            [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect]];
        } break;
            
        case 2: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength) / 2;
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        case 3: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength * 2) / 3;
            CGRect imgRect = CGRectMake((superViewW - _cellImageViewchrSideLength) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
            [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect]];
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];
        } break;
            
        case 4: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength * 2) / 3;
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        case 5: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength * 2 - _margin) / 2;
            CGRect imgRect1 = CGRectMake((superViewW - 2 * _cellImageViewchrSideLength - _margin) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
            [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect1]];
            
            CGRect imgRect2 = CGRectMake(imgRect1.origin.x + imgRect1.size.width + _margin, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
            [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect2]];
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];
        } break;
            
        case 6: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength * 2 - _margin) / 2;
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        case 7: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength * 3) / 4;
            CGRect imgRect = CGRectMake((superViewW - _cellImageViewchrSideLength) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
            [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect]];
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];
        } break;
            
        case 8: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength * 3) / 4;
            CGRect imgRect1 = CGRectMake((superViewW - 2 * _cellImageViewchrSideLength - _margin) / 2, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
            [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect1]];
            
            CGRect imgRect2 = CGRectMake(imgRect1.origin.x + imgRect1.size.width + _margin, row_1_origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
            [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect2]];
            
            [self generatorMatrix:count beginOriginY:row_1_origin_y + _cellImageViewchrSideLength + _margin];
        } break;
            
        case 9: {
            CGFloat row_1_origin_y = (superViewW - _cellImageViewchrSideLength * 3) / 4;
            [self generatorMatrix:count beginOriginY:row_1_origin_y];
        } break;
            
        default: break;
    }
}

- (void)generatorMatrix:(NSInteger)count beginOriginY:(CGFloat)beginOriginY
{
    int cellCount;
    int maxRow;
    int maxColumn;
    int ignoreCountOfBegining;
    
    if (count <= 4)
    {
        maxRow = 2;
        maxColumn = 2;
        ignoreCountOfBegining = count % 2;
        cellCount = 4;
    } else {
        maxRow = 3;
        maxColumn = 3;
        ignoreCountOfBegining = count % 3;
        cellCount = 9;
    }
    
    for (int i = 0; i < cellCount; i++) {
        if (i > count - 1) break;
        if (i < ignoreCountOfBegining) continue;
        
        int row = floor((float)(i - ignoreCountOfBegining) / maxRow);
        int column = (i - ignoreCountOfBegining) % maxColumn;
        
        CGFloat origin_x = _margin + _cellImageViewchrSideLength * column + _margin * column;
        CGFloat origin_y = beginOriginY + _cellImageViewchrSideLength * row + _margin * row;
        
        CGRect imgRect = CGRectMake(origin_x, origin_y, _cellImageViewchrSideLength, _cellImageViewchrSideLength);
        [_imageViewsFrames addObject:[NSValue valueWithCGRect:imgRect]];
    }
}

- (void)generateImageViewSideLengthWithCanvasView:(CGFloat)imgViewW byImageViewsCount:(NSInteger)count
{
    CGFloat sideLength = 0.0f;
    
    if (count == 1) {
        sideLength = imgViewW / 2.0;
    } else if (count >=2 && count <=4) {
        sideLength = (imgViewW - _margin * 3) / 2.0;
    } else {
        sideLength = (imgViewW - _margin * 4) / 3.0;
    }
    
    _cellImageViewchrSideLength = sideLength;
}

@end

