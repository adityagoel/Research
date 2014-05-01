//
//  XMLParser.h
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppItem.h"
@interface XMLParser : NSObject <NSXMLParserDelegate>{
    // an ad hoc string to hold element value
    NSMutableString *currentElementValue;
    // user object
    AppItem *item;
    // array of user objects
    NSMutableArray *arrayItems;
}
@property (nonatomic, retain)AppItem* item;
@property (nonatomic, retain)NSMutableArray* arrayItems;
-(XMLParser *)initXMLParser;
@end
