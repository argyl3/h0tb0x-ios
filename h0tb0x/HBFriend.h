//
//  HBFriend.h
//  h0tb0x
//
//  Created by argyl3 on 4/22/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HBFriend : NSObject<NSCoding>

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* fingerprint;

+ (NSArray*) allFriends;
+ (void) saveAll;

@end
