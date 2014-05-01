//
//  PickerModel.m
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import "PickerModel.h"

@implementation PickerModel
+(NSString*)nameOfFormat : (NSUInteger)row
{
    NSString* format;
    
    switch (row) {
        case 0:
            format = @"json";
            break;
        case 1:
            format = @"xml";
        default:
            break;
            
    }
    
    
    return format;
}
+(int)numberOfObjects: (NSUInteger)row
{
    int Count = 0;

    switch (row) {
        case 0:
            Count = 100;
            break;
        case 1:
            Count = 150;
            break;
        case 2:
            Count = 200;
            break;
        case 3:
            Count = 250;
            break;
        case 4:
            Count = 300;
            break;
        case 5:
            Count = 350;
            break;
        case 6:
            Count = 400;
            break;
        default:
            break;
    }

    return Count;
}
@end
