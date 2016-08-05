//
//  ViewController.m
//  AvatarSynthesisDemo
//
//  Created by apple2015 on 16/8/4.
//  Copyright © 2016年 apple2015. All rights reserved.
//

#import "ViewController.h"
#import "TSGroupListCell.h"
#import "TSCroupModel.h"
#import "ComposeAvatar.h"
#define COMBINED_HEAD_TAG 45678

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView  * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    [self.view addSubview:self.tableView];

}

- (void)initData
{
    NSArray * arr1=@[@"http://www.xilexuan.com/IBS/SHW/20160517/572E97@2200000016.jpg",@"http://www.xilexuan.com/IBS/SHW/20160517/C6EFF4@2200002818.jpg",@"http://img.xunbao178.com/download/appavatar/20160104/b_2200016786_771484_a9f9t8_100_100.jpg",@"http://img.xunbao178.com/download/appavatar/20151202/b_2200016787_559527_v6j4x6_100_100.jpg",@"http://wx.qlogo.cn/mmopen/SEQ2uumQjyumrRIibLUogibEo7fDzeetdqTSCyEU07DGHibNaUl8EZQg8vJR2X6czcd9TuicjaGI0qxhbf8WAMsscPrQBoPIj2aW/0",@"http://wx.qlogo.cn/mmopen/PiajxSqBRaELIcnmyIlfUcm6q8QSS6apTtlADTaj5FPXN0lFiaU9kbjicduGAV0ibIEictNiagKU8OUDUrR04sZ5NPFg/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdpY99x0lTK7icAEtVrsar3rS84sEeY8hVTnKfaCOCcndCTRGMfF7qWTv0Wm20BjAVXzj3MF96iaUj/0",@"http://wx.qlogo.cn/mmopen/SEQ2uumQjyumrRIibLUogibKX3AG50p0W1KDDDRl62qB198q48t3qrYSQVicoPWNNS6UiaJ1XLUNlMw7B4eDC0W8qrtOyHE20IkU/0",@"http://wx.qlogo.cn/mmopen/EnbZmnxAsQj5R9UcnJfuGWx8m6tzG0BsPa6AqpBibNyRdOibhibtt3DbRCxVyuH7GcDcu51IiaRGoaYM7CsOiaBLEMa5xuRwtGIzZ/0"];


    
    NSArray * arr2=@[@"http://wx.qlogo.cn/mmopen/SEQ2uumQjyuWXqk0HmBcJOUTyvg4WwRBkg3X3h2U3ksZvCc9wPVz7wQ5WQlUb2v2PhnVyUAPcQXibMZyMDc1HzQ/0",@"http://wx.qlogo.cn/mmopen/9C2tmO90VybnuU61jtDN9PSBu5PeqncYlS5Bkxv7epCzmws0SmYqDBDzLVkoH5hC168dBcVNfIaZ4tcqkwG6hP61ciavwhy1a/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScwiaWmlPEnnuS4BjFkPB81oMLH0I3M9BVe16R6icE0PBY0OuqBGl9yKHn1NJbdqPnfjuPv65LEGd0ChH6BicURrCw/0",@"http://wx.qlogo.cn/mmopen/5MbjZeuCUzzP1DUSvM1v0nBRJxWm7GC3noGlfzFP8t6MqmkoeKzcUPCiasIibm5n6xeWXmTLma9yl4XvElA0ibdFeuoTuhLkibFib/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdfDXbzakpicxSGcUQOoGZvNLe28vsY6vMb3lVMOFKSYB1IeOLIEmThyiaIDvC1PeXiaT47V68LJrHm/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZXgdZXC2ibe0H4ic5eDmzGBW8micqpAgvcBbfX3punhgSNpcIE9RJJd0EC48VSvs3B78rd05ORHkKGW/0",@"http://wx.qlogo.cn/mmopen/EnbZmnxAsQj5R9UcnJfuGc6YHGibPslyibWiciaLtDJlogXgmWiaqFBb1Mwoq9BjXc3SeIcAUovIibpg6532I5bicBHYGol5VuCg5TK/0",@"http://wx.qlogo.cn/mmopen/fiaTE6Cian9ibdmGcOXmg8gZDtd6J42rB2OpkNjlX7BNBHCPePJfcaUhicTm2ibm84CNO67tVIKltjImGaqvXyH9CzcVhvUw7HELA/0",@"http://wx.qlogo.cn/mmopen/ajNVdqHZLLAJYLkTTAFVXQrcbxNTPBz8yicBw7oDQtoRyFyQvqc3Mo9k2zX8U8nB9KkNLicIBPzenSEER5jP3azA/0"];
    
      NSArray * arr3=@[@"http://wx.qlogo.cn/mmopen/SEQ2uumQjyuWXqk0HmBcJOUTyvg4WwRBkg3X3h2U3ksZvCc9wPVz7wQ5WQlUb2v2PhnVyUAPcQXibMZyMDc1HzQ/0",@"http://wx.qlogo.cn/mmopen/9C2tmO90VybnuU61jtDN9PSBu5PeqncYlS5Bkxv7epCzmws0SmYqDBDzLVkoH5hC168dBcVNfIaZ4tcqkwG6hP61ciavwhy1a/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScwiaWmlPEnnuS4BjFkPB81oMLH0I3M9BVe16R6icE0PBY0OuqBGl9yKHn1NJbdqPnfjuPv65LEGd0ChH6BicURrCw/0",@"http://wx.qlogo.cn/mmopen/5MbjZeuCUzzP1DUSvM1v0nBRJxWm7GC3noGlfzFP8t6MqmkoeKzcUPCiasIibm5n6xeWXmTLma9yl4XvElA0ibdFeuoTuhLkibFib/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdfDXbzakpicxSGcUQOoGZvNLe28vsY6vMb3lVMOFKSYB1IeOLIEmThyiaIDvC1PeXiaT47V68LJrHm/0"];
    NSArray * arr4=@[@"http://wx.qlogo.cn/mmopen/SEQ2uumQjyuWXqk0HmBcJOUTyvg4WwRBkg3X3h2U3ksZvCc9wPVz7wQ5WQlUb2v2PhnVyUAPcQXibMZyMDc1HzQ/0",@"http://wx.qlogo.cn/mmopen/5MbjZeuCUzzP1DUSvM1v0nBRJxWm7GC3noGlfzFP8t6MqmkoeKzcUPCiasIibm5n6xeWXmTLma9yl4XvElA0ibdFeuoTuhLkibFib/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdfDXbzakpicxSGcUQOoGZvNLe28vsY6vMb3lVMOFKSYB1IeOLIEmThyiaIDvC1PeXiaT47V68LJrHm/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZXgdZXC2ibe0H4ic5eDmzGBW8micqpAgvcBbfX3punhgSNpcIE9RJJd0EC48VSvs3B78rd05ORHkKGW/0",@"http://wx.qlogo.cn/mmopen/EnbZmnxAsQj5R9UcnJfuGc6YHGibPslyibWiciaLtDJlogXgmWiaqFBb1Mwoq9BjXc3SeIcAUovIibpg6532I5bicBHYGol5VuCg5TK/0",@"http://wx.qlogo.cn/mmopen/fiaTE6Cian9ibdmGcOXmg8gZDtd6J42rB2OpkNjlX7BNBHCPePJfcaUhicTm2ibm84CNO67tVIKltjImGaqvXyH9CzcVhvUw7HELA/0",@"http://wx.qlogo.cn/mmopen/ajNVdqHZLLAJYLkTTAFVXQrcbxNTPBz8yicBw7oDQtoRyFyQvqc3Mo9k2zX8U8nB9KkNLicIBPzenSEER5jP3azA/0"];
    
        NSArray * arr5=@[@"http://wx.qlogo.cn/mmopen/5MbjZeuCUzzP1DUSvM1v0nBRJxWm7GC3noGlfzFP8t6MqmkoeKzcUPCiasIibm5n6xeWXmTLma9yl4XvElA0ibdFeuoTuhLkibFib/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdfDXbzakpicxSGcUQOoGZvNLe28vsY6vMb3lVMOFKSYB1IeOLIEmThyiaIDvC1PeXiaT47V68LJrHm/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZXgdZXC2ibe0H4ic5eDmzGBW8micqpAgvcBbfX3punhgSNpcIE9RJJd0EC48VSvs3B78rd05ORHkKGW/0",@"http://wx.qlogo.cn/mmopen/EnbZmnxAsQj5R9UcnJfuGc6YHGibPslyibWiciaLtDJlogXgmWiaqFBb1Mwoq9BjXc3SeIcAUovIibpg6532I5bicBHYGol5VuCg5TK/0",@"http://wx.qlogo.cn/mmopen/fiaTE6Cian9ibdmGcOXmg8gZDtd6J42rB2OpkNjlX7BNBHCPePJfcaUhicTm2ibm84CNO67tVIKltjImGaqvXyH9CzcVhvUw7HELA/0",@"http://wx.qlogo.cn/mmopen/ajNVdqHZLLAJYLkTTAFVXQrcbxNTPBz8yicBw7oDQtoRyFyQvqc3Mo9k2zX8U8nB9KkNLicIBPzenSEER5jP3azA/0"];
    
        NSArray * arr6=@[@"http://wx.qlogo.cn/mmopen/SEQ2uumQjyuWXqk0HmBcJOUTyvg4WwRBkg3X3h2U3ksZvCc9wPVz7wQ5WQlUb2v2PhnVyUAPcQXibMZyMDc1HzQ/0",@"http://wx.qlogo.cn/mmopen/5MbjZeuCUzzP1DUSvM1v0nBRJxWm7GC3noGlfzFP8t6MqmkoeKzcUPCiasIibm5n6xeWXmTLma9yl4XvElA0ibdFeuoTuhLkibFib/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdfDXbzakpicxSGcUQOoGZvNLe28vsY6vMb3lVMOFKSYB1IeOLIEmThyiaIDvC1PeXiaT47V68LJrHm/0",@"http://wx.qlogo.cn/mmopen/ajNVdqHZLLAJYLkTTAFVXQrcbxNTPBz8yicBw7oDQtoRyFyQvqc3Mo9k2zX8U8nB9KkNLicIBPzenSEER5jP3azA/0"];
    
            NSArray * arr7=@[@"http://wx.qlogo.cn/mmopen/SEQ2uumQjyuWXqk0HmBcJOUTyvg4WwRBkg3X3h2U3ksZvCc9wPVz7wQ5WQlUb2v2PhnVyUAPcQXibMZyMDc1HzQ/0",@"http://wx.qlogo.cn/mmopen/5MbjZeuCUzzP1DUSvM1v0nBRJxWm7GC3noGlfzFP8t6MqmkoeKzcUPCiasIibm5n6xeWXmTLma9yl4XvElA0ibdFeuoTuhLkibFib/0",@"http://wx.qlogo.cn/mmopen/ibRqXwrJbwScngPptOt0jZdfDXbzakpicxSGcUQOoGZvNLe28vsY6vMb3lVMOFKSYB1IeOLIEmThyiaIDvC1PeXiaT47V68LJrHm/0"];
    
    
    NSArray * dataArray=@[arr1,arr2,arr3,arr4,arr5,arr6,arr7];
    
    for (int i=0; i<20; i++) {
        
        TSCroupModel * model=[[TSCroupModel alloc]init];
        model.name=[NSString stringWithFormat:@"我是大刀王%d",i];
        model.avatorArray=[NSMutableArray arrayWithCapacity:0];
        NSInteger index= arc4random() %7;
        [model.avatorArray setArray:dataArray[index]];
        [self.dataSource addObject:model];
    }


}


-(NSMutableArray *)dataSource
{
    if (_dataSource==nil) {
        _dataSource=[NSMutableArray array];
    }
    return _dataSource;
    
}

-(UITableView*)tableView
{
    if (_tableView==nil) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TSGroupListCell * cell=[TSGroupListCell cellWithTableView:tableView];
    
    TSCroupModel * model=self.dataSource[indexPath.row];
    cell.textLabel.text=model.name;
    
    UIView *imgV = [cell.imageView viewWithTag:COMBINED_HEAD_TAG];
    if (imgV) {
        [imgV removeFromSuperview];
    }
    
    [cell.imageView setImage:[UIImage imageNamed:@"default_group.png"]];

    if (model.avatorView) {
        
        [cell.imageView addSubview:model.avatorView];
    }else{
        
        [self AcheveicGroupMenData:model.avatorArray Withmodel:model WithcellForRowAtIndexPath:indexPath];
        
    }
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 55;
}
//修改tableView 分割线
//-(void)viewDidLayoutSubviews {
//    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
//        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
//        
//    }
//    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
//        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
//    }
//}
//
//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//}




-(void)AcheveicGroupMenData:(NSArray *)array Withmodel:(TSCroupModel*)model  WithcellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSMutableArray * imageArr=[NSMutableArray  arrayWithArray:array];
    
    if (array.count>9) {
        
        [imageArr  setArray:[imageArr subarrayWithRange:NSMakeRange(0, 9)]];
        
    }
    
    
    //异步操作代码块
    [[[ComposeAvatar alloc]init] AchieveGroupAvaterForavaterArray:imageArr withSuperViewW:36 complationHandle:^(UIView *imageV) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            model.avatorView=imageV;
            TSGroupListCell * cell=[_tableView cellForRowAtIndexPath:indexPath];
            if (cell) {
                UIView *imgV = [cell.imageView viewWithTag:COMBINED_HEAD_TAG];
                if (imgV) {
                    [imgV removeFromSuperview];
                }
                if (model.avatorView) {
                    cell.imageView.image = nil;
                    [cell.imageView addSubview:model.avatorView];
                    
                } else{
                    
                    [cell.imageView setImage:[UIImage imageNamed:@"default_group.png"]];
                }
                
            }
            
            
        });
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
