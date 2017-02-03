//
//  Array.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import "Array.h"
#import "BaseClass.h"
#import "PlistObject.h"

@interface Array ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation Array

-(id) initWithValue:(NSArray*) value propertyName:(NSString*) propertyName withParentObject:(id) parent plist:(NSString *)plist{
    self = [super initWithValue:value propertyName:propertyName withParentObject:parent plist:plist];
    if (self) {
        self.array = value;
        self.className = @"NSArray";
        self.propertyName = propertyName;
    }
    return self;
}

-(NSString*) propertyValuesInterface {
    return [NSString stringWithFormat:@"    @property (nonatomic, strong) NSArray *%@;", self.propertyName];
}

@end
