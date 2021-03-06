//
//  ZKNetBadView.h
//  ZK_OnlyOne_Project
//
//  Created by 01 on 2018/12/12.
//  Copyright © 2018 极客_艾欧尼亚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^reStartBlock)(void);

@interface ZKNetBadView : UIView
-(void)reStartCallBack:(reStartBlock)block;

@property(nonatomic,copy)reStartBlock block;
@end

NS_ASSUME_NONNULL_END
