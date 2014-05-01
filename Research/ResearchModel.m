//
//  ResearchModel.m
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import "ResearchModel.h"

@implementation ResearchModel

+ (NSData*)fetchDataOfCount :(int)count ofFormat:(NSString*)format
{
   
    NSString* urlString = [NSString stringWithFormat:@"https://itunes.apple.com/us/rss/topfreeapplications/limit=%d/%@" ,            count,format];
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSData* data = [[NSData alloc]initWithContentsOfURL:url];
    return data;
    
    
}


@end
