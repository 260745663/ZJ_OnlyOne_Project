//
//  ZKConstant.h
//  ZK_OnlyOne_Project
//
//  Created by 01 on 2018/12/11.
//  Copyright © 2018 极客_艾欧尼亚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZKConstant : NSObject
/** 用户token*/
extern NSString *const token;

/**新闻接口地址*/
extern NSString * const newsUrl;
/**新闻appKey*/
extern NSString * const newsAppKey;

/**微信精选*/
extern NSString * const newsWeiChatUrl;

/**微信精选appKey*/
extern NSString * const newsWeiChatAppKey;


/**笑话----按更新时间查询笑话---- 接口地址*/
extern NSString * const jokeListUrl;
/**笑话----最新笑话---- 接口地址*/
extern NSString * const jokeTextUrl;
/**笑话----按更新时间查询趣图*/
extern NSString * const jokeQueryImgByTime;
/**笑话----最新趣图*/
extern NSString * const jokeNewstImg;

/**笑话----AppKey*/
extern NSString * const jokeAppKey;

/**天气查询接口*/
extern NSString * const weatherUrl;

/**题库接口 ---- 问题*/
extern NSString * const queryUrl;
/**题库接口 ---- 答案*/
extern NSString * const answerUrl;

/**题库appKey*/
extern NSString * const queryAppkey;
@end

NS_ASSUME_NONNULL_END
