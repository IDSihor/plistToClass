//
//  main.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlistObject.h"
#import "FileManager.h"

int main(int argc, const char * argv[]) {// 1st parameter - plist file, 2nd parameter - class file to fill propeeries
    @autoreleasepool {
        NSString *nameOfPlist = [NSString stringWithUTF8String:argv[1]];
        
        NSLog(@"name - %@", nameOfPlist);
        NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@.plist", nameOfPlist]];
        NSLog(@"name - %@", mainDictionary);
        
        //NSDictionary *mainDictionary = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"plist"]];
        PlistObject *plist = [[PlistObject alloc] initWithValue:mainDictionary propertyName:nameOfPlist withParentObject:nil plist:nameOfPlist];
        
        LogRed(@"%@", plist.fullInterface);
        LogGreen(@"%@", plist.fullImplementation);

        NSString *path2 = [NSString stringWithFormat:@"%@.h", [NSString stringWithUTF8String:argv[2]] ] ;
        NSString *path3 = [NSString stringWithFormat:@"%@.m", [NSString stringWithUTF8String:argv[2]] ] ;
        NSMutableString *file = [[NSMutableString alloc] initWithString:@""];
        NSMutableString *fileM = [[NSMutableString alloc] initWithString:@""];
        
        NSString *import = @"\n#import <Foundation/Foundation.h>\n";
        [file insertString:import atIndex:0];
        [file insertString:plist.fullInterface atIndex:import.length];
        import = [NSString stringWithFormat:@"\n#import \"%@\";\n", path2];
        [fileM insertString:import atIndex:0];
        [fileM insertString:plist.fullImplementation atIndex:import.length];
        [file writeToFile:path2 atomically:YES encoding:NSUTF8StringEncoding error:nil];
        [fileM writeToFile:path3 atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    return 0;
}





