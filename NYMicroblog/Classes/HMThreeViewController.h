//
//  HMThreeViewController.h
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMBaseViewController.h"
@interface HMThreeViewController : UIViewController  //If inherited from baseVC, can't change into other VC like UITableViewController etc. If inherited from tableviewVC, can't have the custom "back" or "more" barbuttonitem.


//So better intercept the pushViewController:animated: method of its navigation controller.
@end
