//  Created by Tejash on 12/12/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.

#import "Result.h"

NSString *const kResultAdult = @"adult";
NSString *const kResultBackdropPath = @"backdrop_path";
NSString *const kResultGenreIds = @"genre_ids";
NSString *const kResultIdField = @"id";
NSString *const kResultOriginalLanguage = @"original_language";
NSString *const kResultOriginalTitle = @"original_title";
NSString *const kResultOverview = @"overview";
NSString *const kResultPopularity = @"popularity";
NSString *const kResultPosterPath = @"poster_path";
NSString *const kResultReleaseDate = @"release_date";
NSString *const kResultTitle = @"title";
NSString *const kResultVideo = @"video";
NSString *const kResultVoteAverage = @"vote_average";
NSString *const kResultVoteCount = @"vote_count";

@interface Result ()
@end
@implementation Result




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kResultAdult] isKindOfClass:[NSNull class]]){
		self.adult = [dictionary[kResultAdult] boolValue];
	}

	if(![dictionary[kResultBackdropPath] isKindOfClass:[NSNull class]]){
		self.backdropPath = dictionary[kResultBackdropPath];
	}	
	if(![dictionary[kResultGenreIds] isKindOfClass:[NSNull class]]){
		self.genreIds = dictionary[kResultGenreIds];
	}	
	if(![dictionary[kResultIdField] isKindOfClass:[NSNull class]]){
		self.idField = [dictionary[kResultIdField] integerValue];
	}

	if(![dictionary[kResultOriginalLanguage] isKindOfClass:[NSNull class]]){
		self.originalLanguage = dictionary[kResultOriginalLanguage];
	}	
	if(![dictionary[kResultOriginalTitle] isKindOfClass:[NSNull class]]){
		self.originalTitle = dictionary[kResultOriginalTitle];
	}	
	if(![dictionary[kResultOverview] isKindOfClass:[NSNull class]]){
		self.overview = dictionary[kResultOverview];
	}	
	if(![dictionary[kResultPopularity] isKindOfClass:[NSNull class]]){
		self.popularity = [dictionary[kResultPopularity] floatValue];
	}

	if(![dictionary[kResultPosterPath] isKindOfClass:[NSNull class]]){
		self.posterPath = dictionary[kResultPosterPath];
	}	
	if(![dictionary[kResultReleaseDate] isKindOfClass:[NSNull class]]){
		self.releaseDate = dictionary[kResultReleaseDate];
	}	
	if(![dictionary[kResultTitle] isKindOfClass:[NSNull class]]){
		self.title = dictionary[kResultTitle];
	}	
	if(![dictionary[kResultVideo] isKindOfClass:[NSNull class]]){
		self.video = [dictionary[kResultVideo] boolValue];
	}

	if(![dictionary[kResultVoteAverage] isKindOfClass:[NSNull class]]){
		self.voteAverage = [dictionary[kResultVoteAverage] floatValue];
	}

	if(![dictionary[kResultVoteCount] isKindOfClass:[NSNull class]]){
		self.voteCount = [dictionary[kResultVoteCount] integerValue];
	}

	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	dictionary[kResultAdult] = @(self.adult);
	if(self.backdropPath != nil){
		dictionary[kResultBackdropPath] = self.backdropPath;
	}
	if(self.genreIds != nil){
		dictionary[kResultGenreIds] = self.genreIds;
	}
	dictionary[kResultIdField] = @(self.idField);
	if(self.originalLanguage != nil){
		dictionary[kResultOriginalLanguage] = self.originalLanguage;
	}
	if(self.originalTitle != nil){
		dictionary[kResultOriginalTitle] = self.originalTitle;
	}
	if(self.overview != nil){
		dictionary[kResultOverview] = self.overview;
	}
	dictionary[kResultPopularity] = @(self.popularity);
	if(self.posterPath != nil){
		dictionary[kResultPosterPath] = self.posterPath;
	}
	if(self.releaseDate != nil){
		dictionary[kResultReleaseDate] = self.releaseDate;
	}
	if(self.title != nil){
		dictionary[kResultTitle] = self.title;
	}
	dictionary[kResultVideo] = @(self.video);
	dictionary[kResultVoteAverage] = @(self.voteAverage);
	dictionary[kResultVoteCount] = @(self.voteCount);
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
	[aCoder encodeObject:@(self.adult) forKey:kResultAdult];	if(self.backdropPath != nil){
		[aCoder encodeObject:self.backdropPath forKey:kResultBackdropPath];
	}
	if(self.genreIds != nil){
		[aCoder encodeObject:self.genreIds forKey:kResultGenreIds];
	}
	[aCoder encodeObject:@(self.idField) forKey:kResultIdField];	if(self.originalLanguage != nil){
		[aCoder encodeObject:self.originalLanguage forKey:kResultOriginalLanguage];
	}
	if(self.originalTitle != nil){
		[aCoder encodeObject:self.originalTitle forKey:kResultOriginalTitle];
	}
	if(self.overview != nil){
		[aCoder encodeObject:self.overview forKey:kResultOverview];
	}
	[aCoder encodeObject:@(self.popularity) forKey:kResultPopularity];	if(self.posterPath != nil){
		[aCoder encodeObject:self.posterPath forKey:kResultPosterPath];
	}
	if(self.releaseDate != nil){
		[aCoder encodeObject:self.releaseDate forKey:kResultReleaseDate];
	}
	if(self.title != nil){
		[aCoder encodeObject:self.title forKey:kResultTitle];
	}
	[aCoder encodeObject:@(self.video) forKey:kResultVideo];	[aCoder encodeObject:@(self.voteAverage) forKey:kResultVoteAverage];	[aCoder encodeObject:@(self.voteCount) forKey:kResultVoteCount];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.adult = [[aDecoder decodeObjectForKey:kResultAdult] boolValue];
	self.backdropPath = [aDecoder decodeObjectForKey:kResultBackdropPath];
	self.genreIds = [aDecoder decodeObjectForKey:kResultGenreIds];
	self.idField = [[aDecoder decodeObjectForKey:kResultIdField] integerValue];
	self.originalLanguage = [aDecoder decodeObjectForKey:kResultOriginalLanguage];
	self.originalTitle = [aDecoder decodeObjectForKey:kResultOriginalTitle];
	self.overview = [aDecoder decodeObjectForKey:kResultOverview];
	self.popularity = [[aDecoder decodeObjectForKey:kResultPopularity] floatValue];
	self.posterPath = [aDecoder decodeObjectForKey:kResultPosterPath];
	self.releaseDate = [aDecoder decodeObjectForKey:kResultReleaseDate];
	self.title = [aDecoder decodeObjectForKey:kResultTitle];
	self.video = [[aDecoder decodeObjectForKey:kResultVideo] boolValue];
	self.voteAverage = [[aDecoder decodeObjectForKey:kResultVoteAverage] floatValue];
	self.voteCount = [[aDecoder decodeObjectForKey:kResultVoteCount] integerValue];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Result *copy = [Result new];

	copy.adult = self.adult;
	copy.backdropPath = [self.backdropPath copy];
	copy.genreIds = [self.genreIds copy];
	copy.idField = self.idField;
	copy.originalLanguage = [self.originalLanguage copy];
	copy.originalTitle = [self.originalTitle copy];
	copy.overview = [self.overview copy];
	copy.popularity = self.popularity;
	copy.posterPath = [self.posterPath copy];
	copy.releaseDate = [self.releaseDate copy];
	copy.title = [self.title copy];
	copy.video = self.video;
	copy.voteAverage = self.voteAverage;
	copy.voteCount = self.voteCount;

	return copy;
}
@end
