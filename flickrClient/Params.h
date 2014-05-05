//
//  Params.h
//  flickrClient
//
//  Created by fumiharu on 2014/05/05.
//  Copyright (c) 2014年 fumiharu. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kApiKey;
extern NSString *const kSecret;
extern NSString *const kUrl;
extern NSString *const kPhotoURL;

//NSString *const kApiKey     = @"3828f10e1533e8f8ee9d58b3723cbcdd";
//NSString *const kSecret     = @"cf970695a9a57e47";
//NSString *const kUrl        = @"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=10&format=json&nojsoncallback=1";
//NSString *const kPhotoURL   = @"http://farm%@.staticflickr.com/%@/%@_%@.jpg";

// photo source urls example https://www.flickr.com/services/api/misc.urls.html
//http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
//http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}_[mstzb].jpg
//http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{o-secret}_o.(jpg|gif|png)

//s	small square 75x75
//q	large square 150x150
//t	thumbnail, 100 on longest side
//m	small, 240 on longest side
//n	small, 320 on longest side
//-	medium, 500 on longest side
//z	medium 640, 640 on longest side
//c	medium 800, 800 on longest side†
//b	large, 1024 on longest side*
//o	original image, either a jpg, gif or png, depending on source format

@interface Params : NSObject
@end
