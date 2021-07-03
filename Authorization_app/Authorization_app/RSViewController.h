//
//  RSViewController.h
//  Authorization_app
//
//  Created by Anna Ershova on 01.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSViewController : UIViewController
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;
@property (nonatomic) UITouch *authorizeTouch;
- (void)keyboardWillHide:(id)sender;
- (void)didTapAnywhere:(UITapGestureRecognizer *)sender;
- (void)didTapOnButton:(UITapGestureRecognizer *)sender;
@end

NS_ASSUME_NONNULL_END
