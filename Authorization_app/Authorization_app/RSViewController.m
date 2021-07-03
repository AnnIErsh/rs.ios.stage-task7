//
//  RSViewController.m
//  Authorization_app
//
//  Created by Anna Ershova on 01.07.2021.
//

#import "RSViewController.h"
#import "RSViewController+KeyboardHandling.h"
#import "Data.h"

@interface RSViewController () <UITextFieldDelegate>
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
    for (id i in self.view.subviews)
    {
        if ([i isMemberOfClass: [UITextField class]])
        {
            [self addDelegates:i];
            [i addTarget:self
                  action:@selector(tappingBegin:)
        forControlEvents: UIControlEventEditingDidBegin];
        }
    }
    [self subscribeOnKeyboardEvents];
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
    self.password.secureTextEntry = YES;
    UIColor *color = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0];
    self.password.layer.borderColor = color.CGColor;
    self.password.layer.borderWidth = 1.5;
    self.password.layer.cornerRadius = 5;
}

- (void)authorizeComfigurationNormal {
    UIColor *color = [UIColor colorWithRed:0.50 green:0.64 blue:0.93 alpha:1.00];
    [self.authorize setTitle: @"Authorize" forState:UIControlStateNormal];
    self.authorize.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightSemibold];
    [self.authorize setTitleColor:color forState:UIControlStateNormal];
    self.authorize.backgroundColor = [UIColor clearColor];
    self.authorize.layer.borderColor = color.CGColor;
    self.authorize.layer.borderWidth = 2;
    self.authorize.layer.cornerRadius = 10;
    UIImage *image = [UIImage new];
    if (@available(iOS 13.0, *))
        image = [UIImage systemImageNamed:@"person" withConfiguration:[UIImageSymbolConfiguration configurationWithFont:[UIFont systemFontOfSize:13 weight:UIFontWeightBold]]];
    else
        image = [UIImage imageNamed:@"person.png"];
    self.authorize.tintColor = color;
    [self.authorize setImage:image forState:UIControlStateNormal];
    [self.authorize setImage:image forState:UIControlStateDisabled];
    self.authorize.imageEdgeInsets = UIEdgeInsetsMake(10, 0, 10, 0);
    self.authorize.titleEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 0);
    [self.authorize addTarget:self action: @selector(didTapOnButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.authorize addTarget:self action: @selector(didHighlight) forControlEvents:UIControlEventTouchDown];
}

- (void)authorizeComfigurationDisable {
    [self.authorize setAlpha:0.5];
}


- (BOOL)authorizeComfigurationCheck:(UITextField *)text withData:(NSString *)dataText{
    BOOL check = NO;
    UIColor *colorWrong = [UIColor colorWithRed:0.76 green:0.00 blue:0.08 alpha:1.00];
    UIColor *colorRight = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0];
    if (![text.text isEqualToString: dataText])
    {
        //NSLog(@"FAIL");
        text.layer.borderColor = colorWrong.CGColor;
    }
    else
    {
        //NSLog(@"SUCCESS");
        text.layer.borderColor = colorRight.CGColor;
        check = YES;
    }
    return check;
}

- (void)tappingBegin:(UITextField *)sender {
    sender.text = @"";
    UIColor *colorRight = [UIColor colorWithRed:0.3 green:0.36 blue:0.41 alpha:1.0];
    sender.layer.borderColor = colorRight.CGColor;
    //NSLog(@"tapping");
}

- (void)keyboardWillHide:(id)sender {
    NSLog(@"KeyBoard Close");
    for (id i in self.view.subviews)
    {
        if ([i isMemberOfClass:[UITextField class]])
            [self cleanPlaceholders:i];
    }
}
- (void)addDelegates:(UITextField *)sender {
    sender.delegate = self;
}

- (void)cleanPlaceholders:(UITextField*)sender {
    //sender.text = @"";
}

- (void)didTapAnywhere:(UITapGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.view];
    BOOL isPointInsideButton = CGRectContainsPoint(self.authorize.frame, location);
    if (isPointInsideButton)
        [self.authorize endEditing: NO];
    else
        [self.view endEditing: YES];
}

- (void)didTapOnButton:(UITapGestureRecognizer *)sender {
    Data *data = [Data new];
    [self.authorize setBackgroundColor:[UIColor clearColor]];
    [self.authorize.titleLabel setAlpha:1.0];
    [self.authorize.imageView setAlpha:1.0];
    BOOL loginCheck = [self authorizeComfigurationCheck: self.login withData: data.login];
    BOOL passwordCheck = [self authorizeComfigurationCheck: self.password withData: data.password];
    if (loginCheck && passwordCheck)
    {
        [self.view endEditing:YES];
        [self authorizeComfigurationDisable];
        self.authorize.userInteractionEnabled = NO;
        self.login.userInteractionEnabled = NO;
        self.password.userInteractionEnabled = NO;
        self.authorize.tintAdjustmentMode = UIViewTintAdjustmentModeNormal;
        
    }
    else
    {
        [self.authorize endEditing:NO];
    }
}

- (void)didHighlight {
    if (self.authorize.isHighlighted && self.authorize.isEnabled)
    {
        [self.authorize setBackgroundColor:[UIColor colorWithRed:0.50 green:0.64 blue:0.93 alpha:0.2]];
        [self.authorize.imageView setAlpha:1.0];
        [self.authorize.titleLabel setAlpha:0.4];
        UIImage *imageFill = [UIImage new];
        if (@available(iOS 13.0, *))
            imageFill = [UIImage systemImageNamed:@"person.fill" withConfiguration:[UIImageSymbolConfiguration configurationWithFont:[UIFont systemFontOfSize:13 weight:UIFontWeightBold]]];
        else
            imageFill = [UIImage imageNamed:@"person_fill.png"];
        [self.authorize setImage:imageFill forState:UIControlStateHighlighted];
    }
    else
    {
        [self.authorize.titleLabel setAlpha:1.0];
        [self.authorize.imageView setAlpha:1.0];
        [self.authorize setBackgroundColor:[UIColor clearColor]];
    }
}

@end
