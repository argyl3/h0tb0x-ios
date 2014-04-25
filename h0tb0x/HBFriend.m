//
//  HBFriend.m
//  h0tb0x
//
//  Created by argyl3 on 4/22/14.
//  Copyright (c) 2014. All rights reserved.
//

#import "HBFriend.h"

@implementation HBFriend

#define kFriendsFilename @"friends.dat"
#define kFriendsKey @"friends"

static NSArray* friends = nil;

+ (NSArray*) allFriends
{
    NSString *friendsPath = [[HBFriend getDocsDir] stringByAppendingPathComponent:kFriendsFilename];
    
    NSData *codedData = [[NSData alloc] initWithContentsOfFile: friendsPath];
    if (codedData == nil) return nil;
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:codedData];
    friends = [unarchiver decodeObjectForKey: kFriendsKey];
    
    return nil;
}

+ (void) saveAll
{
    NSString *friendsPath = [[HBFriend getDocsDir] stringByAppendingPathComponent:kFriendsFilename];
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:friends forKey:kFriendsKey];
    [archiver finishEncoding];
    [data writeToFile:friendsPath atomically:YES];
}


+ (NSString *)getDocsDir
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"HotBox"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];
    
    return documentsDirectory;
}


// this class supports NSCoding for serialization and storage

#pragma mark NSCoding

#define kNameKey @"name"
#define kFingerprintKey @"fp"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject: self.name forKey:kNameKey];
    [encoder encodeObject: self.fingerprint forKey:kFingerprintKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    HBFriend* newObject = [self init];
    newObject.name = [decoder decodeObjectForKey:kNameKey];
    newObject.fingerprint = [decoder decodeObjectForKey:kFingerprintKey];
    return newObject;
}



@end
