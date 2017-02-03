//
//  Date.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import "Date.h"

@implementation Date

-(id) initWithValue:(NSDate*) value propertyName:(NSString*) propertyName withParentObject:(id) parent plist:(NSString *)plist{
    self = [super initWithValue:value propertyName:propertyName withParentObject:parent plist:plist];
    if (self) {
        self.value = value;
        self.className = @"NSDate";
        self.propertyName = propertyName;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat: @"yyyy-MM-dd HH:mm:ss zzz"];
        self.date = [formatter stringFromDate:(NSDate*)value];
    }
    return self;
}

-(NSString*) implementation {
    NSString *imp = [NSString stringWithFormat:@"-(NSDate*) %@ {\n  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];\n  [formatter setDateFormat: @\"yyyy-MM-dd HH:mm:ss zzz\"];\n  return [formatter dateFromString:@\"%@\"];\n}\n", self.propertyName, self.date];
    return imp;
}

-(NSString*) propertyValuesInterface {
    return [NSString stringWithFormat:@"    @property (nonatomic, strong) NSDate *%@;", self.propertyName];
}

@end
