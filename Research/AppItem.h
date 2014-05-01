//
//  AppItem.h
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppItem : NSObject <NSCoding>
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *category;
@property (nonatomic) NSString *artist;
@property (nonatomic) NSString *releaseDate;
@property (nonatomic) NSString *price;
@property (nonatomic) NSString *itemSummary;
@property (nonatomic) NSURL    *artworkURL;
@property (nonatomic) NSURL    *storeURL;

- (id)initWithJSONAttributes:(NSDictionary *)jsonAttributes;
-(NSDictionary *)dictionary;

@end
