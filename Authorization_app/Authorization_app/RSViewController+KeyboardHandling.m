//
//  RSViewController+KeyboardHandling.m
//  Authorization_app
//
//  Created by Anna Ershova on 02.07.2021.
//

#import "RSViewController+KeyboardHandling.h"

@implementation RSViewController (KeyboardHandling)
- (void)subscribeOnKeyboardEvents {
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardWillHideNotification
                                             object:nil];
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                 action:@selector(didTapAnywhere:)];
    self.tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:self.tapRecognizer];
}
@end
