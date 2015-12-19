//
//  WSAdVC.m
//  01-百思不得姐框架搭建
//
//  Created by Ws on 15/12/19.
//  Copyright © 2015年 Ws. All rights reserved.
//
/*
 http://mobads.baidu.com/cpro/ui/mads.php?code2=phcqnauguhykfmrquanhmgn_iaubthfqmgksuarhiwdgulpxnz3vndtkqw08nau_i1y1p1rhmhwz5hb8nbul5hdknwrhta_qmvqvqhgguhi_py4mqhf1tvchmgky5h6hmypw5rfrhzuet1dgulnhuan85hchuy7s5hdhiywgujy3p1n3mwb1pvdlnvf-pyf4mhr4nyrvmwpbmhwbpjclpyfspht3uwm4fmplphykfh7sta-b5yrzpj6spvrdfhpdtwysfmkzuykemyfqnauguau95rnsnbfknbm1qhnkww6vpjujnbdkfwd1qhnsnbrsnhwkfywawiu9mlfqhbd_h70htv6qnhn1pauvmynqnjclnj0lnj0lnj0lnj0lnj0hthyqniuvujykfhkc5hrvnb3dfh7spyfqnw0srj64nbu9tjysfmub5hdhtzfeujdztlk_mgpcfmp85rnsnbfknbm1qhnkww6vpjujnbdkfwd1qhnsnbrsnhwkfywawiubnhfdnjd4rjnvpwykfh7stzu-twy1qw68nbuwuhydnhchiayqphdzfhqsmypgizbqniuythuytjd1uavxnz3vnzu9ijyzfh6qp1rsfmws5y-fpaq8uht_nbuymycqnau1ijykpjrsnhb3n1mvnhdkqwd4niuvmybqniu1uy3qwd-hqdfkhakhhnn_hr7fq7udq7pchzkhir3_ryqnqd7jfzkpirn_wdkhqdp5hikpfrb_fnc_nbwpqddrhzkdinchtvww5hnvpj0zqwndnhrvnbsdpwb4ri3kpw0kphmhmlnqph6lp1ndm1-wpydvnhkbraw9nju9phihmh9wmh6zrjrhtv7_5iu85hdhtvd15hdhtltqp1rsfh4etjyypw0spzuvuyyqn1mynjc8nwbvrjtdqjrvrhb4qwdvnjddpbuk5yrzpj6spvrdgvpstbu_my4btvp9tarqnam
 
 */
#define WSCode @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

#import "WSAdVC.h"
#import "WSTabBarController.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>
#import <MJExtension.h>
#import "AdItem.h"
@interface WSAdVC ()
//存放广告的背景View
@property (weak, nonatomic) IBOutlet UIImageView *adImageV;

//放广告的view
@property (weak, nonatomic) UIImageView *showAdImageV;

@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (strong, nonatomic) AdItem *adItem;

@property (weak, nonatomic) NSTimer *timer;

@property (weak, nonatomic) AFHTTPSessionManager *manager;


@end

@implementation WSAdVC

- (IBAction)jumpClick {
    
    //取消定时器 取消网络请求  变换Window的RootVC
    [self.timer invalidate];
    
    //跳出主控制器
    WSTabBarController *mainTabBarController = [[WSTabBarController alloc]init];
    [UIApplication sharedApplication].keyWindow.rootViewController = mainTabBarController;
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpAdImage];
    //请求网络数据
    [self loadData];
    
    //定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}
//设置广告图片展示View的尺寸,保证多屏适配
- (void)setUpAdImage {
    //根据屏幕尺寸设置不同的屏适配
    if (iPhone6P) {
        _adImageV.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    } else if (iPhone6) {
        _adImageV.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (iPhone5) {
        _adImageV.image = [UIImage imageNamed:@"LaunchImage-568h"];
    } else if (iPhone4) {
        _adImageV.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    
}

//懒加载showAdImageV
- (UIImageView *)showAdImageV {
    if (!_showAdImageV) {
        UIImageView *showAdImageV = [[UIImageView alloc]init];
        _showAdImageV = showAdImageV;
        
        //userInteractionEnabled
        _showAdImageV.userInteractionEnabled = YES;
        
        //点击图片,增加跳转手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jump)];
        [_showAdImageV addGestureRecognizer:tap];
        
        //加载父控件上
        [self.view insertSubview:showAdImageV belowSubview:self.jumpBtn];
    }
    
    return _showAdImageV;
}
//timeChange
- (void)timeChange {
    
    static int time = 3;
    self.jumpBtn.titleLabel.text = [NSString stringWithFormat:@"跳过(%d)",time];
    if (time == 0) {
        //和点击跳过效果一个,所以执行那个方法
        [self jumpClick];
        return;
    }
    
    
    
    time --;
}


//广告跳转的界面
- (void)jump {
    //拿到跳转的URL
    NSURL *url = [NSURL URLWithString:self.adItem.ori_curl];
    
    //判断是否能用,能用就跳转
    if ([[UIApplication sharedApplication]canOpenURL:url]) {
        //默认是safari
        [[UIApplication sharedApplication] openURL:url];
    }
    
}

//监听点击跳过按钮

- (void)loadData {
    //创建网络会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    self.manager = manager;
    //请求参数
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    parameter[@"code2"] = WSCode;
    //发送GET请球
    [manager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameter success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary   * _Nullable responseObject) {
        //拿所需要的key 去拿value
        NSDictionary *adKey = [responseObject[@"ad"] lastObject];
        
        //字典转模型
        _adItem = [AdItem mj_objectWithKeyValues:adKey];
        
        //拿到数据后可以设置图片了,SDWebImage
          //设置下尺寸先
        
        CGFloat w = WSScreenW;
        CGFloat h = WSScreenW / _adItem.w * _adItem.h;
        //判断下屏幕是不是能放下
        if (WSScreenW > _adItem.h) {
            h = WSScreenH;
        }
        
        //下来设置展示图片view的尺寸
        CGRect frame = CGRectMake(0, 0, w, h);
        self.showAdImageV.frame = frame;
          //SDWebImage show the ad
        
        [_showAdImageV sd_setImageWithURL:[NSURL URLWithString:_adItem.w_picurl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NSLog(@"加载完啦");
        }];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

#pragma mark -注意点

//在这个控制器销毁的时候,也要把定时器/网络请求销毁
- (void)dealloc {
    

    
    //这里调用的是一个系统的实例方法
       //先把请求关了
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    //  主动干掉这个会话管理者 
    [self.manager invalidateSessionCancelingTasks:NO];
    
}

@end
