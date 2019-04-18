//
//  HeaderView.m
//  tableview下拉放大图片
//
//  Created by zz on 2019/4/18.
//  Copyright © 2019 zz. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.clipsToBounds = YES;
    
    [self.ivIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - Getter

- (UIImageView *)ivIcon {
    if (!_ivIcon) {
        _ivIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ppImage.jpg"]];
        _ivIcon.contentMode = UIViewContentModeScaleAspectFill;
        
        [self addSubview:_ivIcon];
    }
    return _ivIcon;
}

@end
