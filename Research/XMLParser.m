//
//  XMLParser.m
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import "XMLParser.h"
#import "AppItem.h"
@implementation XMLParser
@synthesize item,arrayItems;
- (XMLParser *) initXMLParser {
    //[super init];
    // init array of user objects
    arrayItems = [[NSMutableArray alloc] init];
    return self;
}



// PARSE THE START OF ELEMENT
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"entry"]) {
        item = [[AppItem alloc] init];
    }
    if ([elementName isEqualToString:@"category"]) {
        item.category = [attributeDict objectForKey:@"label"];
    }
}


//PARSE AN ELEMENT VALUE
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    /*if (!currentElementValue) {
        // init the ad hoc string with the value
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        // append value to the ad hoc string
        [currentElementValue appendString:string];
    }*/
    currentElementValue = [[NSMutableString alloc] initWithString:string];
}

/// PARSE THE END OF ELEMNT

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"feed"]) {
        // We reached the end of the XML document
        return;
    }
    
    if ([elementName isEqualToString:@"entry"]) {
        // We are done with user entry – add the parsed user
        // object to our user array
        [arrayItems addObject:item];
        // release user object
        item = nil;
    } else {
        
        if ([elementName isEqualToString:@"title"]) {
            item.title = currentElementValue;
        }
        //else if ([elementName isEqualToString:@"category"])
          //  item.category = currentElementValue;
        else if ([elementName isEqualToString:@"im:artist"])
            item.artist = currentElementValue;
        else if ([elementName isEqualToString:@"im:releaseDate"])
            item.releaseDate = currentElementValue;
        else if ([elementName isEqualToString:@"im:price"])
            item.price = currentElementValue;
        else if ([elementName isEqualToString:@"summary"])
            item.itemSummary = currentElementValue;
        else if ([elementName isEqualToString:@"im:image"])
            item.artworkURL = [NSURL URLWithString:currentElementValue];
        else if ([elementName isEqualToString:@"id"])
            item.storeURL = [NSURL URLWithString:currentElementValue];
        
    }
    
   currentElementValue = nil;
}@end
