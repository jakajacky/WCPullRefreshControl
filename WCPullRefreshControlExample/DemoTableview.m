//
//  DemoTableview.m
//  WCPullRefreshControlExample
//
//  Created by huangwenchen on 15/4/14.
//  Copyright (c) 2015年 huangwenchen. All rights reserved.
//

#import "DemoTableview.h"

@interface DemoTableview()<UIScrollViewDelegate,WCPullRefreshControlDelegate>
@property (strong,nonatomic)WCSimplePullRefreshControl * pullRefresh;

@end

@implementation DemoTableview
-(void)viewDidLoad{
    self.pullRefresh = [[WCSimplePullRefreshControl alloc] initWithScrollview:self.tableView
                                                                       Action:^{
                                                                           
                                                                       }
                                                                 progressItem:WCProgressItemTypeRoundCricle
                                                               refreshingItem:WCRefreshingItemTypeSystemIndicator
                                                                   lastUpdate:nil
                                                               showLastUpdate:NO
                                                                    textColor:[UIColor blueColor]
                                                                    itemColor:[UIColor blueColor]
                                                                   pullHeight:64];
    self.pullRefresh.delegate = self;
}
-(void)reset{
    [self.pullRefresh finishRefreshingSuccessully:YES];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.pullRefresh updateWHenScrollDidEndDraging];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.pullRefresh updateWhenScrollviewScroll];
}
-(void)DidStartRefreshingWithScrollview:(UIScrollView *)scrollview{
    [self performSelector:@selector(reset) withObject:nil afterDelay:2.0];
}

@end