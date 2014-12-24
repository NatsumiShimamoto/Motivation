//
//  ViewController.h
//  motivation
//
//  Created by 嶋本夏海 on 2014/12/23.
//  Copyright (c) 2014年 嶋本夏海. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UITextField *textField;
    IBOutlet UITextField *goalTField;
    
    NSArray *conArray;
    NSMutableArray *conMArr;
    
    NSString *formattedDateString;
}

-(IBAction)hozon;


@end

