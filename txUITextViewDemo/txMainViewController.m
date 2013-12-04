//
//  txMainViewController.m
//  txUITextViewDemo
//
//  Created by tingxuan.qhm on 13-12-3.
//  Copyright (c) 2013年 tingxuan.qhm. All rights reserved.
//

#import "txMainViewController.h"

@interface txMainViewController ()

@end

@implementation txMainViewController
@synthesize resultLabel;
@synthesize inputUITextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(leaveTextView)];
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 40, 20)];
    titleLabel.text = [NSString stringWithFormat:@"文案"];
    titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.view addSubview:titleLabel];
    self.resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, 320, 40)];
    [self.view addSubview:resultLabel];
    self.inputUITextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 60, 320, 150)];
    self.inputUITextView.textColor = [UIColor blueColor];
    self.inputUITextView.font = [UIFont fontWithName:@"Arial" size:12.0];
    self.inputUITextView.backgroundColor = [UIColor grayColor];
    self.inputUITextView.keyboardType = UIKeyboardTypeNumbersAndPunctuation;//键盘类型
    self.inputUITextView.returnKeyType = UIReturnKeyYahoo; //返回键的类型
    self.inputUITextView.scrollEnabled = YES;
    self.inputUITextView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    self.inputUITextView.clearsOnInsertion = YES;
    
    self.inputUITextView.delegate = self;
    [self.view addSubview:self.inputUITextView];
    
    //添加inputAccessoryView,对应方法三
    UIToolbar *topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    topView.barStyle = UIBarStyleDefault;
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard)];
    [topView setItems:[NSArray arrayWithObjects:doneButton, nil]];
    self.inputUITextView.inputAccessoryView = topView;
    
    //添加点击手势，使得点击空白区域，使键盘收起，对应方法四
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTaped:)];
    [self.view addGestureRecognizer:tapGesture];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark UITextViewDelegate
//退出键盘方式一
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        
        [textView resignFirstResponder];
        
        return NO;
        
    }
    return YES;    
}

//退出键盘方式二

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    self.navigationItem.rightBarButtonItem = nil;
    
}

- (void) leaveTextView{
    [self.inputUITextView resignFirstResponder];
}

//退出键盘方式三

-(void)dismissKeyboard
{
    [self.inputUITextView resignFirstResponder];
}


//退出键盘方式四，点击页面的空白区域

-(void)viewTaped:(UITapGestureRecognizer*)tapGesture
{
    [self.inputUITextView resignFirstResponder];
}


@end
