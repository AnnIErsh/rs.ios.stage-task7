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
    [self authorizeComfigurationNormal];
}

- (void)textConfiguration {
    self.text.text = @"RSSchool";
    self.text.textAlignment = NSTextAlignmentCenter;
    [self.text setFont:[UIFont boldSystemFontOfSize:36]];
    [self.text setTextColor:[UIColor blackColor]];
    [self.text setBackgroundColor:[UIColor whiteColor]];
}

- (void)loginConfiguration {
    self.login.placeholder = @"Login";
    UIColor *color = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0];
    self.login.layer.borderColor = color.CGColor;
    self.login.layer.borderWidth = 1.5;
    self.login.layer.cornerRadius = 5;
    
    
}

- (void)passwordConfiguration {
    self.password.placeholder = @"Password";
    UIColor *color = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0];
    self.password.layer.borderColor = color.CGColor;
    self.password.layer.borderWidth = 1.5;
    self.password.layer.cornerRadius = 5;
}

-(void)authorizeComfigurationNormal {
    UIColor *color = [UIColor colorWithRed: 0.50 green: 0.64 blue: 0.93 alpha: 1.00];
    [self.authorize setTitle: @"Authorize" forState:UIControlStateNormal];
    self.authorize.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    [self.authorize setTitleColor:color forState:UIControlStateNormal];
    self.authorize.backgroundColor = [UIColor clearColor];
    self.authorize.layer.borderColor = color.CGColor;
    self.authorize.layer.borderWidth = 2;
    self.authorize.layer.cornerRadius = 10;
    UIImage *image = [UIImage new];
    if (@available(iOS 13.0, *)) {
        image = [UIImage systemImageNamed:@"person" withConfiguration:[UIImageSymbolConfiguration configurationWithFont:[UIFont systemFontOfSize:13 weight:UIFontWeightSemibold]]];
    } else {
        image = [UIImage imageNamed:@"person.png"];
    }
    self.authorize.tintColor = color;
    [self.authorize setImage:image forState:UIControlStateNormal];
    self.authorize.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 0);
    self.authorize.titleEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 0);
}

@end
