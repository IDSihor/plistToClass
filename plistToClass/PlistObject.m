//
//  PlistObject.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import "PlistObject.h"
#import "Array.h"
#import "Date.h"
#import "Number.h"
#import "String.h"


@interface PlistObject ()

@property (nonatomic, strong) NSDictionary *plist;


@end

@implementation PlistObject

-(id) initWithValue:(NSDictionary*) value propertyName:(NSString*) propertyName withParentObject:(id) parent {
    self = [super initWithValue:value propertyName:propertyName withParentObject:parent ];
    if (self) {
        self.className = [NSString stringWithFormat:@"%@_class", propertyName];
        self.properties = [NSMutableArray new];
    }
    
    [self parseDictionary:self.value forKey:propertyName];
    
    return self;
}

-(void) parseDictionary:(NSDictionary*) dictionary forKey:(NSString*) keys {
    NSMutableDictionary *object = [NSMutableDictionary new];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (isObjectOfClass(obj, NSArray)) {
            Array *array = [[Array alloc] initWithValue:obj propertyName:key withParentObject:self];
            [self.properties addObject:array];
        } else if (isObjectOfClass(obj, NSDictionary)) {
            PlistObject *newClass = [[PlistObject alloc] initWithValue:obj propertyName:key withParentObject:self];
            [self.properties addObject:newClass];
        } else {
            if (isObjectOfClass(obj, NSDate)) {
                Date *value = [[Date alloc] initWithValue:obj propertyName:key withParentObject:self];
                [self.properties addObject:value];
            } else if (isObjectOfClass(obj, NSNumber)){
                Number *value = [[Number alloc] initWithValue:obj propertyName:key withParentObject:self];
                [self.properties addObject:value];
            } else {
                String *value = [[String alloc] initWithValue:obj propertyName:key withParentObject:self];
                [self.properties addObject:value];
            }
        }
    }];
}

-(NSString*) propertyValuesInterface {
    return [NSString stringWithFormat:@"    @property (nonatomic, strong) %@ *%@;",self.className, self.propertyName];
}

-(NSString*) fullImplementation {
    NSMutableArray *array = [NSMutableArray new];
    
    
    [self.properties enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (isObjectOfClass(obj, PlistObject)) {
            [array addObject:((PlistObject*)obj).fullImplementation];
        }
    }];
    
    
    
    [array addObject:[NSString stringWithFormat:@"@implementation %@", self.className]];
    
    [array addObject:@"-(id) init {\n  self = [super init];\n  if (self) {\n\n"];
    
    [self.properties enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (isObjectOfClass(obj, PlistObject)) {
            [array addObject:[NSString stringWithFormat:@"  self.%@ = [%@ new];", ((PlistObject*)obj).propertyName, ((PlistObject*)obj).className]];
        }
    }];
    
    [array addObject:@"  }\n  return self;\n}\n"];
    
    [self.properties enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!isObjectOfClass(obj, PlistObject)) {
            NSString *newPath = [((BaseClass*)obj).path substringFromIndex:5];
            NSString *getter = [NSString stringWithFormat:@"-(%@*) %@ {\n  NSDictionary *plist = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@\"%@\" ofType:@\"plist\"]];\n  return [plist valueForKeyPath: @\"%@\"];\n}\n", ((BaseClass*)obj).className, ((BaseClass*)obj).propertyName, self.plistName, newPath];
            [array addObject:getter];        }
        
    }];
    
    [array addObject:@"@end\n"];
    
    return [array componentsJoinedByString:@"\n"];
}

-(NSString*) fullInterface {
    
    NSMutableArray *array = [NSMutableArray new];
    
    [self.properties enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (isObjectOfClass(obj, PlistObject)) {
            [array addObject:((PlistObject*)obj).fullInterface];
        }
    }];
    
    [array addObject:[NSString stringWithFormat:@"\n@interface %@ : NSMutableDictionary\n", self.className]];
    
    [self.properties enumerateObjectsUsingBlock:^(BaseClass *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *property = obj.propertyValuesInterface;
        [array addObject:property];
    }];
    [array addObject:@"@end\n"];
    NSString *properties = [array componentsJoinedByString:@"\n"];
    
    return  properties;
}

@end
