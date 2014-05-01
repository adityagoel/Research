//
//  ResearchModel.h
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResearchModel : NSObject
+ (NSData*)fetchDataOfCount :(int)count ofFormat:(NSString*)format;
@end
