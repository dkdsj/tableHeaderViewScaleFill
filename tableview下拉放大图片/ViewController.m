//
//  ViewController.m
//  tableview下拉放大图片
//
//  Created by zz on 2019/4/18.
//  Copyright © 2019 zz. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tbTest;
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) HeaderView *vHeader;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (@available(iOS 11, *)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIApplicationBackgroundFetchIntervalNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.items = @[@"1", @"2", @"3", @"4", @"5", @"6",@"1", @"2", @"3", @"4", @"5", @"6",@"1", @"2", @"3", @"4", @"5", @"6",@"1", @"2", @"3", @"4", @"5", @"6",@"1", @"2", @"3", @"4", @"5", @"6",@"1", @"2", @"3", @"4", @"5", @"6"];
    
    self.tbTest.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:.3];
    self.vHeader.backgroundColor = [UIColor whiteColor];
}

#pragma mark - TB
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat delta = (offsetY+kHeightHeaderView);
    NSLog(@"%f delta:%f", offsetY, delta);
    
    if (delta<=kHeightHeaderView){
        CGRect frame = self.vHeader.frame;
        frame.size.height = kHeightHeaderView-delta;
        self.vHeader.frame = frame;
    }
}

#pragma mark - Getter

- (UITableView *)tbTest {
    if (!_tbTest) {
        _tbTest = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tbTest.delegate = self;
        _tbTest.dataSource = self;
        
        _tbTest.showsVerticalScrollIndicator = YES;
        
        _tbTest.contentInset = UIEdgeInsetsMake(kHeightHeaderView, 0, 0, 0);
        _tbTest.scrollIndicatorInsets = UIEdgeInsetsMake(kHeightHeaderView, 0, 0, 0);
        
        [self.view addSubview:_tbTest];
    }
    return _tbTest;
}

- (HeaderView *)vHeader {
    if (!_vHeader) {
        _vHeader = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kHeightHeaderView)];
        [self.view addSubview:_vHeader];
    }
    return _vHeader;
}

@end
