//
//  ModelJSON.h
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ModelJSON : NSObject

@property NSMutableArray* arrayAppItems;
@property NSData* jsonData;
-(BOOL)fetchJSONDataOfCount :(int)count;
-(BOOL)DeserializeJSONWithData;
-(BOOL)SerializeJSONOfCount : (NSMutableArray *)arrayItems;
-(NSMutableArray*)getNumberOfObjects : (int)count;
@end
