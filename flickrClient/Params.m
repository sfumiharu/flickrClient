//
//  Params.m
//  flickrClient
//
//  Created by fumiharu on 2014/05/05.
//  Copyright (c) 2014年 fumiharu. All rights reserved.
//

#import "Params.h"

NSString *const kApiKey     = @"3828f10e1533e8f8ee9d58b3723cbcdd";
NSString *const kSecret     = @"cf970695a9a57e47";
NSString *const kUrl        = @"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=10&format=json&nojsoncallback=1";
NSString *const kPhotoURL   = @"http://farm%@.staticflickr.com/%@/%@_%@.jpg";

@implementation Params

@end
