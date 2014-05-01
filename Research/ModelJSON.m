//
//  ModelJSON.m
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import "ModelJSON.h"
#import "ResearchModel.h"
#import "AppItem.h"
#define ERROR @"Parsing Error: %@"
@implementation ModelJSON



-(BOOL)fetchJSONDataOfCount :(int)count
{
    _jsonData = [[NSData alloc]init];
    _jsonData = [ResearchModel fetchDataOfCount:count ofFormat:@"json"];
    return YES;
}

-(BOOL)DeserializeJSONWithData
{
    
    NSArray *arrayEntries = [[NSArray alloc]init];
    _arrayAppItems = [[NSMutableArray alloc]init];
    NSError* error;
    
    if(_jsonData)
    {
        NSDictionary *parsedJSON = [NSJSONSerialization JSONObjectWithData:_jsonData options:0 error:&    error];
        if (error)
            NSLog(ERROR, error);
        
        arrayEntries = [[parsedJSON objectForKey:@"feed"]objectForKey:@"entry"];
    }
    
    int itemCount = 0;
    for (itemCount=0; itemCount<[arrayEntries count]; itemCount++) {
        
        AppItem *item = [[AppItem alloc]initWithJSONAttributes:[arrayEntries objectAtIndex:itemCount]];
        [_arrayAppItems addObject:item];
        
    }
    
    return YES;
    
}
-(NSMutableArray*)getNumberOfObjects : (int)count
{
    NSMutableArray* arrayItems = [[NSMutableArray alloc]init];
    for (int itemCount = 0; itemCount<count; itemCount++) {
        [arrayItems addObject:[_arrayAppItems[itemCount] dictionary]];
    }
    return arrayItems;
}
-(BOOL)SerializeJSONOfCount : (NSMutableArray *)arrayItems;
{
    NSError *writeError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arrayItems options:0 error:&writeError];
    /*NSString *jsonString;
    if (!writeError) {
       jsonString  = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSLog(@"%@",jsonString);*/
    
    return YES;
}


@end
