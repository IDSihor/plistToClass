//
//  BaseClass.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import "BaseClass.h"

@implementation BaseClass

-(id) init {
    self = [super init];
    if (self) {
        self.types = @{@"__NSCFData" : @"NSData",
                       @"__NSCFConstantString" : @"NSString",
                       @"__NSCFNumber" : @"NSNumber",
                       @"__NSTaggedDate" : @"NSDate",
                       @"__NSCFBoolean" : @"NSNumber",
                       @"__NSCFString" : @"NSString"};
    }
    return self;
}

-(id) initWithValue:(id) value propertyName:(NSString*) propertyName withParentObject:(BaseClass*) parent plist:(NSString*) plist {
    self = [super init];
    if (self) {
        self.plistOriginalName = plist;
        self.value = value;
        self.propertyName = propertyName;
        self.path = parent ? [NSString stringWithFormat:@"%@.%@",(parent).path, propertyName] : @"Main";
    }
    return self;
}

-(NSString*) interface {
    return [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;", self.className, self.propertyName];
}

@end
