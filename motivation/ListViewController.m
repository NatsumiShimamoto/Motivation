//
//  ListViewController.m
//  motivation
//
//  Created by 嶋本夏海 on 2014/12/23.
//  Copyright (c) 2014年 嶋本夏海. All rights reserved.
//

#import "ListViewController.h"
#import "ViewController.h"

@interface ListViewController ()

@end

@implementation ListViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    contentsMArr = [ud objectForKey:@"ud"]; //取り出し
    NSLog(@"あああああ");
    
    for(i = 0; i < [contentsMArr count]; i++){
        NSLog(@"ぱっ");
        NSLog(@"iは%d",i);
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+(50*i), 100, 90, 30)];
        dateLabel.userInteractionEnabled = YES;
        
        UILabel *accidentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+(50*i), 100, 90, 30)];
        UILabel *goalLabel =[[UILabel alloc]initWithFrame:CGRectMake(10+(50*i), 110, 90, 30)];
        
        
        
        NSString *dateText  = contentsMArr[i][@"date"];
        NSString *accidentText  = contentsMArr[i][@"accident"];
        NSString *goalText  = contentsMArr[i][@"goal"];
        
        accidentLabel.text = [NSString stringWithFormat:@"%@",accidentText];
        goalLabel.text = [NSString stringWithFormat:@"%@",goalText];

        
        
        NSLog(@"i is %d",i);
        dateLabel.text = [NSString stringWithFormat:@"%@",dateText];
        
        
        [self.view addSubview:dateLabel];
        [self.view addSubview:accidentLabel];
        [self.view addSubview:goalLabel];

        
    }
    
    [ud synchronize]; //UserDefaultsに即時反映
    

}


/*
 - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
 {
 // タッチされたときの処理
 UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(dateLabel.frame.origin.x,dateLabel.frame.origin.y+30,120, 90)];
 imgView.backgroundColor = [UIColor blackColor];
 
 [self.view addSubview:imgView];
 
 
 NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
 
 contentsMArr = [ud objectForKey:@"ud"];//取り出し
 
 
 UILabel *accidentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+(50*i), 100, 90, 30)];
 UILabel *goalLabel =[[UILabel alloc]initWithFrame:CGRectMake(10+(50*i), 110, 90, 30)];
 
 
 NSString *accidentText  = conMArr[i][@"accident"];
 NSString *goalText  = conMArr[i][@"goal"];
 
 accidentLabel.text = [NSString stringWithFormat:@"%@",accidentText];
 goalLabel.text = [NSString stringWithFormat:@"%@",goalText];
 
 [imgView addSubview:accidentLabel];
 [imgView addSubview:goalLabel];
 
 }
 
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
