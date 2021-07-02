//
//  RSViewController.m
//  Authorization_app
//
//  Created by Anna Ershova on 01.07.2021.
//

#import "RSViewController.h"
#import "Data.h"

@interface RSViewController ()
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *authorize;
@end

@implementation RSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self textConfiguration];
    [self loginConfiguration];
    [self passwordConfiguration];
}

- (void)textConfiguration {
    self.text.text = @"RSSchool";
    //self.text.textAlignment = NSTextAlignmentCenter;
    [self.text setFont:[UIFont boldSystemFontOfSize:36]];
    [self.text setTextColor:[UIColor blackColor]];
    [self.text setBackgroundColor:[UIColor whiteColor]];
    self.text.frame = CGRectMake(self.view.frame.size.width - self.text.frame.size.width - 101, 80, self.text.frame.size.width, self.text.frame.size.height);
}

- (void)loginConfiguration {
    self.login.placeholder = @"Login";
    self.login.frame = CGRectMake(36, self.text.frame.size.height + 80, 303, self.login.frame.size.height);
    UIColor *color = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0];
    self.login.layer.borderColor = color.CGColor;
    self.login.layer.borderWidth = 1.5;
    self.login.layer.cornerRadius = 5;
    
    
}

- (void)passwordConfiguration {
    self.password.placeholder = @"Password";
    self.password.frame = CGRectMake(self.login.frame.origin.x, self.login.frame.origin.y + self.login.frame.size.height + 30, 303, self.password.frame.size.height);
    UIColor *color = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0];
    self.password.layer.borderColor = color.CGColor;
    self.password.layer.borderWidth = 1.5;
    self.password.layer.cornerRadius = 5;
}


@end
