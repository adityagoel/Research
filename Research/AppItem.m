//
//  AppItem.m
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import "AppItem.h"

@implementation AppItem


- (id)initWithJSONAttributes:(NSDictionary *)jsonAttributes
{
    self = [super init];
    if (self) {
        
        _title = jsonAttributes[@"im:name"][@"label"]  ;
        _artist = jsonAttributes[@"im:artist"][@"label"];
        _price = jsonAttributes[@"im:price"][@"label"];;
        _category = jsonAttributes[@"category"][@"attributes"][@"label"];
        _releaseDate = jsonAttributes[@"im:releaseDate"][@"attributes"][@"label"];
        _itemSummary = jsonAttributes[@"summary"][@"label"];
        NSString *artURL = jsonAttributes[@"im:image"][1][@"label"] ;
        if (artURL.length !=0)
            _artworkURL = [[NSURL alloc]initWithString: artURL] ;
        _storeURL = [[NSURL alloc]initWithString:jsonAttributes[@"id"][@"label"] ];
        
    }
    return self;
}
-(NSDictionary *)dictionary {
    return [NSDictionary dictionaryWithObjectsAndKeys:self.title,@"title",self.artist,@"artist",self.price, @"price",            self.category,@"category",self.releaseDate,@"releaseDate",self.itemSummary,@"itemSummary",[self.artworkURL absoluteString],@"image",[self.storeURL absoluteString],@"id",nil];
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self=[super init])
    {
        _title = [aDecoder decodeObjectForKey:@"title"];
        _category = [aDecoder decodeObjectForKey:@"category"];
        _artist = [aDecoder decodeObjectForKey:@"artist"];
        _releaseDate = [aDecoder decodeObjectForKey:@"releaseDate"];
        _price = [aDecoder decodeObjectForKey:@"price"];
        _itemSummary = [aDecoder decodeObjectForKey:@"summary"];
        _artworkURL = [aDecoder decodeObjectForKey:@"artworkURL"];
        _storeURL = [aDecoder decodeObjectForKey:@"storeURL"];
        
        
        
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_category forKey:@"category"];
    [aCoder encodeObject:_artist forKey:@"artist"];
    [aCoder encodeObject:_releaseDate forKey:@"releaseDate"];
    [aCoder encodeObject:_price forKey:@"price"];
    [aCoder encodeObject:_itemSummary forKey:@"summary"];
    [aCoder encodeObject:_artworkURL forKey:@"artworkURL"];
    [aCoder encodeObject:_storeURL forKey:@"storeURL"];
    
}

@end
