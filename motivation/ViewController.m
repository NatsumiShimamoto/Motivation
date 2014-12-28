//
//  ViewController.m
//  motivation
//
//  Created by 嶋本夏海 on 2014/12/23.
//  Copyright (c) 2014年 嶋本夏海. All rights reserved.
//

#import "ViewController.h"
#import "ListViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    conMArr = [[NSMutableArray alloc] init];
    
     // 枠線のスタイルを設定
    textField.borderStyle = UITextBorderStyleRoundedRect;
    goalTField.borderStyle = UITextBorderStyleRoundedRect;

    /* textFieldのサイズ変更 */
    CGRect textFieldFrame= textField.frame;
    textFieldFrame = CGRectMake(textFieldFrame.origin.x, textFieldFrame.origin.y,
                                 textFieldFrame.size.width, textFieldFrame.size.height+100);
    
    // ラベルのテキストのフォントを設定
    textField.font = [UIFont fontWithName:@"Helvetica" size:14];
    
    // キーボードの種類を設定
    textField.keyboardType = UIKeyboardTypeDefault;
    goalTField.keyboardType = UIKeyboardTypeDefault;
    
    // リターンキーの種類を設定
    textField.returnKeyType = UIReturnKeyDefault;
    goalTField.returnKeyType = UIReturnKeyDefault;
    
    // 編集中にテキスト消去ボタンを表示
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    goalTField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    // デリゲートを設定
    textField.delegate = self;
    goalTField.delegate = self;
    
    segLevel = 1;
    
    // UITextFieldのインスタンスをビューに追加
    [self.view addSubview:textField];
    [self.view addSubview:goalTField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -textField

/* --- やるべきことの入力 --- */
- (IBAction)doText{
    
    textField.adjustsFontSizeToFitWidth = NO;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    goalTField.adjustsFontSizeToFitWidth = NO;
    goalTField.clearButtonMode = UITextFieldViewModeWhileEditing;
}


- (BOOL)textField:(UITextField *)lenTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 入力済みのテキストを取得
    NSMutableString *mText = [lenTextField.text mutableCopy];
    
    // 入力済みのテキストと入力が行われたテキストを結合
    [mText replaceCharactersInRange:range withString:string];
    
    
    return YES;
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //キーボードを閉じる
    [textField resignFirstResponder];
    [goalTField resignFirstResponder];
    
}



-(IBAction)hozon{
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"MMMdd" options:0 locale:[NSLocale currentLocale]];
    dateFormatter.dateFormat = formatString;
    NSDate *date = [NSDate date];
    
    formattedDateString = [dateFormatter stringFromDate:date];
    NSLog(@"%@", formattedDateString);
    
    
    NSDictionary *contents = [NSDictionary dictionaryWithObjectsAndKeys:
                              textField.text,@"accident",
                              goalTField.text,@"goal",
                              formattedDateString,@"date",
                              [NSNumber numberWithInt:segLevel],@"level",
                              nil];
    
    
    NSLog(@"%@",contents[@"date"]);
    
    
    [conMArr addObject:contents];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults]; //UserDefaultsのデータ領域の一部をudとおく
    [ud setObject:conMArr forKey:@"ud"];//udにhogeでmarrayをセットして保存
    
    
    [ud synchronize]; //UserDefaultsに即時反映
    
    
    NSLog(@"新規作成");
    
    ListViewController *listVC = [self.storyboard instantiateViewControllerWithIdentifier:@"list"];
    [self presentViewController:listVC animated:YES completion:nil];
    
    textField.text = @"";
    goalTField.text = @"";
    
    
    
    [ud setObject:numberArr forKey:@"numberArr"];

    
    
}



- (IBAction)SegChanged:(UISegmentedControl *)sender
{
    
    segLevel = (int)sender.selectedSegmentIndex+1; //tag1のSegmentedControlが選択されたら、選択された値をkigenNumに入れる
    NSLog(@"level is %d",segLevel);
}
@end
