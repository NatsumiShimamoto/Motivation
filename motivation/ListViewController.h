//
//  ListViewController.h
//  motivation
//
//  Created by 嶋本夏海 on 2014/12/23.
//  Copyright (c) 2014年 嶋本夏海. All rights reserved.
//

#import "ViewController.h"

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
    
    NSString *accidentText;
    NSString *goalText;
    
    UIButton *dateButton;
    
    NSMutableArray *accidentArr;
    NSMutableArray *goalArr;
}

-(IBAction)back;
-(void)datePushed:(id)sender;

@end
