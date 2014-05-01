//
//  PickerModel.h
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PickerModel : NSObject
+(NSString*)nameOfFormat : (NSUInteger)row;
+(int)numberOfObjects: (NSUInteger)row;
@end
