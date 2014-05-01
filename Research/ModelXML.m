//
//  ModelXML.m
//  Research
//
//  Created by Aditya Goel on 4/16/14.
//  Copyright (c) 2014 ADITYAGOEL. All rights reserved.
//

#import "ModelXML.h"
#import "ResearchModel.h"
#import "XMLParser.h"
@implementation ModelXML

-(BOOL)fetchXMLDataOfCount :(int)count
{
    _XMLData = [[NSData alloc]init];
    _XMLData = [ResearchModel fetchDataOfCount:count ofFormat:@"xml"];
    
    return YES;
}
-(BOOL)DeserializeJXMLWithData;
{
    NSXMLParser *nsXMLParser = [[NSXMLParser alloc]initWithData:_XMLData];
    
    XMLParser *parser = [[XMLParser alloc]initXMLParser];
    [nsXMLParser setDelegate:parser];
    
    BOOL success = [nsXMLParser parse];
    _arrayAppItems = [parser arrayItems];
    
    return success;
    
}
-(NSMutableSet*)getNumberOfObjects : (int)count
{
    NSMutableSet *setItems = [[NSMutableSet alloc]init];
    for (int itemCount = 0; itemCount<count; itemCount++) {
        [setItems addObject: [_arrayAppItems[itemCount] dictionary]];
    }
    return setItems ;
}
-(NSString*)ConvertDictionarytoXML:(NSDictionary*)dictionary withStartElement:(NSString*)startele
{
    NSMutableString *xml = [[NSMutableString alloc] initWithString:@""];
    NSArray *arr = [dictionary allKeys];
    [xml appendString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    [xml appendString:[NSString stringWithFormat:@"<%@>",startele]];
    for(int i=0;i<[arr count];i++)
    {
        id nodeValue = [dictionary objectForKey:[arr objectAtIndex:i]];
        if([nodeValue isKindOfClass:[NSArray class]] )
        {
            if([nodeValue count]>0){
                for(int j=0;j<[nodeValue count];j++)
                {
                    id value = [nodeValue objectAtIndex:j];
                    if([ value isKindOfClass:[NSDictionary class]])
                    {
                        [xml appendString:[NSString stringWithFormat:@"<%@>",[arr objectAtIndex:i]]];
                        [xml appendString:[NSString stringWithFormat:@"%@",[value objectForKey:@"text"]]];
                        [xml appendString:[NSString stringWithFormat:@"</%@>",[arr objectAtIndex:i]]];
                    }
                    
                }
            }
        }
        else if([nodeValue isKindOfClass:[NSDictionary class]])
        {
            [xml appendString:[NSString stringWithFormat:@"<%@>",[arr objectAtIndex:i]]];
            if([[nodeValue objectForKey:@"Id"] isKindOfClass:[NSString class]])
                [xml appendString:[NSString stringWithFormat:@"%@",[nodeValue objectForKey:@"Id"]]];
            else
                [xml appendString:[NSString stringWithFormat:@"%@",[[nodeValue objectForKey:@"Id"] objectForKey:@"text"]]];
            [xml appendString:[NSString stringWithFormat:@"</%@>",[arr objectAtIndex:i]]];
        }
        
        else
        {
            if([nodeValue length]>0){
                [xml appendString:[NSString stringWithFormat:@"<%@>",[arr objectAtIndex:i]]];
                [xml appendString:[NSString stringWithFormat:@"%@",[dictionary objectForKey:[arr objectAtIndex:i]]]];
                [xml appendString:[NSString stringWithFormat:@"</%@>",[arr objectAtIndex:i]]];
            }
        }
    }
    
    [xml appendString:[NSString stringWithFormat:@"</%@>",startele]];
    NSString *finalxml=[xml stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
    //  NSLog(@"%@",xml);
    return finalxml;
}
-(BOOL)SerializeXMLWithSet : (NSMutableSet*)setItems
{
     NSData* archivedData = [NSKeyedArchiver archivedDataWithRootObject:setItems];
    /*NSMutableData* mutableData = [NSMutableData data];
    NSKeyedArchiver* archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:mutableData];
    archiver.outputFormat = NSPropertyListXMLFormat_v1_0;
    [archiver encodeRootObject:setItems];
    [archiver finishEncoding];
    NSString * XML = [[NSString alloc]initWithData:mutableData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",XML);*/
    
    
    return YES;
}



@end
