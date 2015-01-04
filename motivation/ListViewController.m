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
    numberArr = [ud objectForKey:@"numberArr"]; //取り出し
    
    accidentArr = [[NSMutableArray alloc] init];
    goalArr = [[NSMutableArray alloc] init];
    levelArr = [[NSMutableArray alloc] init];
    levelNumArr = [[NSMutableArray alloc] init];
    
    level = 0;
    
    for (int j = 0; j < 5; j++) {
        levelNumArr[j] = [NSNumber numberWithInt:0];
    }
    
    
    
    for(i = 0; i < [contentsMArr count]; i++){
        
        
        NSLog(@"iは%d",i);
        
        
        level = [contentsMArr[i][@"level"] integerValue];
        
        
        
        NSLog(@"レベル　%d",level);
        /* --- 日付 --- */
        int levelCnt = 0;
        switch (level) {
                
            case 1:
                levelCnt = [levelNumArr[0] intValue];
                
                dateButton = [[UIButton alloc] initWithFrame:CGRectMake(23+(75.4*levelCnt), 462.5, 47, 47)];
                
                [[dateButton layer] setCornerRadius:17.0];
                
                NSLog(@"歯入");
                
                levelNumArr[0] = [NSNumber numberWithInt:levelCnt+1];
                
                break;
                
            case 2:
                levelCnt = [levelNumArr[1] intValue];
                
                dateButton = [[UIButton alloc] initWithFrame:CGRectMake(23+(75.4*levelCnt), 364.5, 47, 47)];
                [[dateButton layer] setCornerRadius:17.0];
                
                NSLog(@"おおおお");
                
                levelNumArr[1] = [NSNumber numberWithInt:levelCnt+1];
                
                
                break;
            case 3:
                levelCnt = [levelNumArr[2] intValue];
                
                dateButton = [[UIButton alloc] initWithFrame:CGRectMake(23+(75.4*levelCnt), 266.5, 47, 47)];
                [[dateButton layer] setCornerRadius:17.0];
                
                levelNumArr[2] = [NSNumber numberWithInt:levelCnt+1];
                
                break;
            case 4:
                levelCnt = [levelNumArr[3] intValue];
                
                dateButton = [[UIButton alloc] initWithFrame:CGRectMake(23+(75.4*levelCnt), 168.5, 47, 47)];
                [[dateButton layer] setCornerRadius:17.0];
                
                levelNumArr[3] = [NSNumber numberWithInt:levelCnt+1];
                
                break;
            case 5:
                levelCnt = [levelNumArr[4] intValue];
                dateButton = [[UIButton alloc] initWithFrame:CGRectMake(23+(75.4*levelCnt), 70.5, 47, 47)];
                [[dateButton layer] setCornerRadius:17.0];
                
                levelNumArr[4] = [NSNumber numberWithInt:levelCnt+1];
                
                break;
                
            default:
                break;
                
                
        }
        
        NSLog(@"%@",levelNumArr);
        dateButton.backgroundColor = [UIColor grayColor];
        NSString *dateText  = contentsMArr[i][@"date"];
        [dateButton setTitle:dateText forState:UIControlStateNormal];
        
        NSLog(@"date is %@",dateText);
        NSLog(@"date is %@",dateButton.titleLabel.text);
        
        dateButton.tag = i+1;
        
        [self.view addSubview:dateButton];
        
        [dateButton addTarget:self action:@selector(datePushed:) forControlEvents:UIControlEventTouchUpInside];
        
        NSLog(@"i is %d",i);
        
        
        
        accidentArr[i] = contentsMArr[i][@"accident"];
        goalArr[i] = contentsMArr[i][@"goal"];
        levelArr[i] = contentsMArr[i][@"level"];
        
        
        
        
    }
    
    [ud synchronize]; //UserDefaultsに即時反映
}


-(void)datePushed:(UIButton *)sender{
    
    NSLog(@"sender is %d",sender.tag);
    NSLog(@"current is %d",currentTag);
    
    
    if(!imgView){
        
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(sender.frame.origin.x,sender.frame.origin.y+50,120, 90)];
        
        imgView.backgroundColor = [UIColor grayColor];
        
        [self.view addSubview:imgView];
        
        
        
        accidentLabel = [[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+50, 90, 30)];
        accidentLabel.text = [NSString stringWithFormat:@"%@",accidentArr[sender.tag-1]];
        
        
        goalLabel =[[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+70, 90, 30)];
        goalLabel.text = [NSString stringWithFormat:@"%@",goalArr[sender.tag-1]];
        
        
        levelLabel =[[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+90, 90, 30)];
        levelLabel.text = [NSString stringWithFormat:@"Level.%@",levelArr[sender.tag-1]];
        
        [self.view addSubview:accidentLabel];
        [self.view addSubview:goalLabel];
        [self.view addSubview:levelLabel];
        
        NSLog(@"↑初めて");
        
        
    }
    
    else if(imgView && currentTag == sender.tag){
        
        
        [imgView removeFromSuperview];
        imgView = nil;
        [accidentLabel removeFromSuperview];
        accidentLabel = nil;
        [goalLabel removeFromSuperview];
        goalLabel = nil;
        [levelLabel removeFromSuperview];
        levelLabel = nil;
        
        
        NSLog(@"↑これ消える");
        
    }else{
        
        
        [imgView removeFromSuperview];
        imgView = nil;
        [accidentLabel removeFromSuperview];
        accidentLabel = nil;
        [goalLabel removeFromSuperview];
        goalLabel = nil;
        [levelLabel removeFromSuperview];
        levelLabel = nil;
        
        
        
        imgView = [[UIImageView alloc] initWithFrame:CGRectMake(sender.frame.origin.x,sender.frame.origin.y+50,120, 90)];
        
        imgView.backgroundColor = [UIColor grayColor];
        
        [self.view addSubview:imgView];
        
        
        accidentLabel = [[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+50, 90, 30)];
        accidentLabel.text = [NSString stringWithFormat:@"%@",accidentArr[sender.tag-1]];
        
        
        goalLabel =[[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+70, 90, 30)];
        goalLabel.text = [NSString stringWithFormat:@"%@",goalArr[sender.tag-1]];
        
        
        levelLabel = [[UILabel alloc]initWithFrame:CGRectMake(sender.frame.origin.x+10,sender.frame.origin.y+90, 90, 30)];
        levelLabel.text = [NSString stringWithFormat:@"Level.%@",levelArr[sender.tag-1]];
        
        
        [self.view addSubview:accidentLabel];
        [self.view addSubview:goalLabel];
        [self.view addSubview:levelLabel];
        
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
}


@end
