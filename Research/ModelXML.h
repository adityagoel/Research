//
//  ModelXML.h
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ResearchModel.h"
#import "XMLParser.h"
@interface ModelXML : NSObject

@property NSMutableArray* arrayAppItems;
@property NSData* XMLData;
-(BOOL)fetchXMLDataOfCount :(int)count;
-(BOOL)DeserializeJXMLWithData;
-(BOOL)SerializeXMLWithSet : (NSMutableSet*)setItems;
-(NSMutableSet*)getNumberOfObjects : (int)count;
-(NSString*)ConvertDictionarytoXML:(NSDictionary*)dictionary withStartElement:(NSString*)startele;
@end
