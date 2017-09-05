//
//  TableViewController.h
//  KYCellAnimation
//
//  Created by Kitten Yang on 2/14/15.
//  Copyright (c) 2015 Kitten Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XWLCellAnimationController : UITableViewController

typedef NS_ENUM(NSInteger, XWLCellAnimationType) {
    
    XWLCellAnimationTypeOne = 0,
    
    XWLCellAnimationTypeTwo = 1,
    
    XWLCellAnimationTypeThree = 2,
};

@property (nonatomic, assign) XWLCellAnimationType type;

@end
