//
//  HealthHutHomeVC.h
//  HealthHutModular
//
//  Created by mac on 2021/12/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HealthHutHomeVCDalegate <NSObject>


@required//遵守协议必须实现的方法

-(void)goBack;

 

@end
@interface HealthHutHomeVC : UIViewController
@property(nonatomic,copy)NSString*userId;
@property(nonatomic,weak)id<HealthHutHomeVCDalegate>delegate;

@end

NS_ASSUME_NONNULL_END
