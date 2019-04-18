//
//  HeaderView.h
//  tableview下拉放大图片
//
//  Created by zz on 2019/4/18.
//  Copyright © 2019 zz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

#define kHeightHeaderView 200
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIView

@property (nonatomic, strong) UIImageView *ivIcon;

@end

NS_ASSUME_NONNULL_END
