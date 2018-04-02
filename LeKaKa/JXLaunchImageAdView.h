//
//  JXLaunchImageAdView.h
//  LeKaKa
//
//  Created by 谢龙 on 2018/1/25.
//  Copyright © 2018年 谢龙. All rights reserved.
//

typedef enum {
    FullScreenAdType = 1, // 全屏的广告
    LogoAdType = 0,  //带logo的广告
}AdType;

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

#define mainHeight      [[UIScreen mainScreen] bounds].size.height
#define mainWidth       [[UIScreen mainScreen] bounds].size.width

typedef void (^JXClick)(NSInteger tag);
/**
 *里面主要重写了init方法，init方法方便我们在调用封装的类初始化时传递一些参数，在此，我只传递了三个必要的参数，其他参数都用@property属性来调配，达到自己想要的效果，再有就是一个block的回调函数，主要处理各种事件。下面我们看看.m文件里面实现的部分
 */
@interface JXLaunchImageAdView : UIView

@property(strong,nonatomic)UIImageView *aDImgView;
@property(strong,nonatomic)UIWindow *window;
@property(assign,nonatomic)NSInteger adTime; //倒计时总时长
@property(strong,nonatomic)UIButton *skipBtn;
@property(nonatomic,copy)JXClick clickBlock;

-(instancetype)initWithWindow:(UIWindow *)window andType:(NSInteger)type andImgUrl:(NSString *)url;
@end
