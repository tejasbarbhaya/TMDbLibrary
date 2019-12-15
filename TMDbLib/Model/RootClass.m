//  Created by Tejash on 12/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.

#import "RootClass.h"
#import <CoreGraphics/CoreGraphics.h>

NSString *const kRootClassPage = @"page";
NSString *const kRootClassResults = @"results";
NSString *const kRootClassTotalPages = @"total_pages";
NSString *const kRootClassTotalResults = @"total_results";

@interface RootClass ()
@end
@implementation RootClass




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kRootClassPage] isKindOfClass:[NSNull class]]){
		self.page = [dictionary[kRootClassPage] integerValue];
	}

	if(dictionary[kRootClassResults] != nil && [dictionary[kRootClassResults] isKindOfClass:[NSArray class]]){
		NSArray * resultsDictionaries = dictionary[kRootClassResults];
		NSMutableArray * resultsItems = [NSMutableArray array];
		for(NSDictionary * resultsDictionary in resultsDictionaries){
			Result * resultsItem = [[Result alloc] initWithDictionary:resultsDictionary];
			[resultsItems addObject:resultsItem];
		}
		self.results = resultsItems;
	}
	if(![dictionary[kRootClassTotalPages] isKindOfClass:[NSNull class]]){
		self.totalPages = [dictionary[kRootClassTotalPages] integerValue];
	}

	if(![dictionary[kRootClassTotalResults] isKindOfClass:[NSNull class]]){
		self.totalResults = [dictionary[kRootClassTotalResults] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kRootClassPage] = @(self.page);
	if(self.results != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(Result * resultsElement in self.results){
			[dictionaryElements addObject:[resultsElement toDictionary]];
		}
		dictionary[kRootClassResults] = dictionaryElements;
	}
	dictionary[kRootClassTotalPages] = @(self.totalPages);
	dictionary[kRootClassTotalResults] = @(self.totalResults);
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	[aCoder encodeObject:@(self.page) forKey:kRootClassPage];	if(self.results != nil){
		[aCoder encodeObject:self.results forKey:kRootClassResults];
	}
	[aCoder encodeObject:@(self.totalPages) forKey:kRootClassTotalPages];	[aCoder encodeObject:@(self.totalResults) forKey:kRootClassTotalResults];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.page = [[aDecoder decodeObjectForKey:kRootClassPage] integerValue];
	self.results = [aDecoder decodeObjectForKey:kRootClassResults];
	self.totalPages = [[aDecoder decodeObjectForKey:kRootClassTotalPages] integerValue];
	self.totalResults = [[aDecoder decodeObjectForKey:kRootClassTotalResults] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	RootClass *copy = [RootClass new];

	copy.page = self.page;
	copy.results = [self.results copy];
	copy.totalPages = self.totalPages;
	copy.totalResults = self.totalResults;

	return copy;
}
@end
