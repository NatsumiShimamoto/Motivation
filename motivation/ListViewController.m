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
    accidentArr = [[NSMutableArray alloc] init];
    goalArr = [[NSMutableArray alloc] init];
    
    
    for(i = 0; i < [contentsMArr count]; i++){
        NSLog(@"ぱっ");
        NSLog(@"iは%d",i);
        //dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10+(50*i), 100, 90, 30)];
        //dateLabel.userInteractionEnabled = YES;
        
        dateButton = [[UIButton alloc] initWithFrame:CGRectMake(10+(100*i), 100, 90, 30)];
        dateButton.backgroundColor = [UIColor redColor];
        NSString *dateText  = contentsMArr[i][@"date"];
        [dateButton setTitle:dateText forState:UIControlStateNormal];
        
        NSLog(@"date is %@",dateText);
        NSLog(@"date is %@",dateButton.titleLabel.text);
        dateButton.tag = i+1;
        
        [self.view addSubview:dateButton];
        
        [dateButton addTarget:self action:@selector(datePushed:) forControlEvents:UIControlEventTouchUpInside];
        
        NSLog(@"i is %d",i);
        
        
        // dateLabel.text = [NSString stringWithFormat:@"%@",dateText];
        
        
        accidentArr[i] = contentsMArr[i][@"accident"];
        goalArr[i] = contentsMArr[i][@"goal"];
        
    }
    
    [ud synchronize]; //UserDefaultsに即時反映
}


-(void)datePushed:(UIButton *)sender{
    // int buttonTag = dateButton.tag;
    // dateButton.tag = i + 1;
   
    
    
    NSLog(@"sender is %d",sender.tag);
    NSLog(@"current is %d",currentTag);
    
    if(!imgView){
        // タッチされたときの処理
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(sender.frame.origin.x,sender.frame.origin.y+50,120, 90)];
        
        imgView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:imgView];
        
        
        accidentLabel = [[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+50, 90, 30)];
        accidentLabel.text = [NSString stringWithFormat:@"%@",accidentArr[sender.tag-1]];
        
        goalLabel =[[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+70, 90, 30)];
        goalLabel.text = [NSString stringWithFormat:@"%@",goalArr[sender.tag-1]];
        
        [self.view addSubview:accidentLabel];
        [self.view addSubview:goalLabel];
        NSLog(@"↑初めて");
        
        
    }
    
    else if(imgView && currentTag == sender.tag){
        
               
        [imgView removeFromSuperview];
        imgView = nil;
        [accidentLabel removeFromSuperview];
        accidentLabel = nil;
        [goalLabel removeFromSuperview];
        goalLabel = nil;
        
        NSLog(@"↑これ消える");
        
    }else{
    
       
        [imgView removeFromSuperview];
        imgView = nil;
        [accidentLabel removeFromSuperview];
        accidentLabel = nil;
        [goalLabel removeFromSuperview];
        goalLabel = nil;
        
        
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(sender.frame.origin.x,sender.frame.origin.y+50,120, 90)];
        
        imgView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:imgView];

        
        accidentLabel = [[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+50, 90, 30)];
        accidentLabel.text = [NSString stringWithFormat:@"%@",accidentArr[sender.tag-1]];
        
      
        goalLabel =[[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+70, 90, 30)];
        goalLabel.text = [NSString stringWithFormat:@"%@",goalArr[sender.tag-1]];
        
        
        [self.view addSubview:accidentLabel];
        [self.view addSubview:goalLabel];
        
        NSLog(@"↑変わる");
        
    }
    currentTag = sender.tag;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
    //textField = nil;
    //goalTField = nil;
    textField = [[UITextField alloc] init];
    goalTField = [[UITextField alloc] init];
    
}


@end
