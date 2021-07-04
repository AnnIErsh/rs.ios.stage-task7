//
//  Data.h
//  Authorization_app
//
//  Created by Anna Ershova on 01.07.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject
@property (nonatomic, strong, readonly) NSString *login;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *numbers;
@end

NS_ASSUME_NONNULL_END
