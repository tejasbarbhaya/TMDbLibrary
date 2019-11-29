//
//  NetworkManager.m
//  TMDbLib
//
//  Created by Tejash on 28/11/19.
//  Copyright © 2019 Dezire Technology. All rights reserved.
//

#import "NetworkManager.h"
#import "Addition.h"

NetworkManager *objNetworkManager;

@implementation NetworkManager

+(NetworkManager *) getObject {
    if (objNetworkManager == nil) {
        objNetworkManager = [[NetworkManager alloc] init];
    }
    return objNetworkManager;
}

-(void) doNetworkCall:(NSString *) url complition:(void(^)(NSDictionary* dict,NSError *error)) callback {
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      if(error != nil) {
                                          callback(nil,error);
                                      }else {
                                          NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                          //Below is sample to call Static C library for addition
                                          int total = add(5,6);
                                          NSLog(@"\n total sum from C Library : %d",total);
                                          callback(dict,nil);
                                          
                                          
                                      }
                                  }];
    
    [task resume];
}

@end
