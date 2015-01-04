//
//  ListViewController.h
//  motivation
//
//  Created by 嶋本夏海 on 2014/12/23.
//  Copyright (c) 2014年 嶋本夏海. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ListViewController : ViewController{
    //IBOutlet UILabel *accidentLabel;
    //IBOutlet UILabel *goalLabel;
    //IBOutlet UILabel *dateLabel;
    NSArray *contentsMArr;
    IBOutlet UILabel *dateLabel;
    int i;
    
    
    
    UIImageView *imgView;
    UILabel *accidentLabel;
    UILabel *goalLabel;
    UILabel *levelLabel;

    
    NSString *accidentText;
    NSString *goalText;
    
    UIButton *dateButton;
    
    NSMutableArray *accidentArr;
    NSMutableArray *goalArr;
    NSMutableArray *levelArr;
    
    NSMutableArray *levelNumArr;
    int currentTag;
    int level;
    int level1count;
    int level2count;
    int level3count;
    int level4count;
    int level5count;

}

-(IBAction)back;
-(void)datePushed:(id)sender;

@end
