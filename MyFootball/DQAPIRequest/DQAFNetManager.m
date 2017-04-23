//
//  DQAFNetManager.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQAFNetManager.h"
#import "MBProgressHUD.h"

@implementation DQAFNetManager

+ (instancetype)sharedManager {
    static DQAFNetManager *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:BASEHOST]];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"device_id=eyJpdiI6IkNsdjJhdUd4aVJYQlBha3d3cGl0dFdTbU00eU9vcXU2MFZONWlNNWNjbEE9IiwidmFsdWUiOiJDU2pYSEtsVUYrYm9hditXZk4zSnB6ZkFjZzdvM25JVHk0djZ6cjk5SVNVPSIsIm1hYyI6IjNiNThmZWYzMWRjMTk4YTkyMDM4YjYwNjRiNmM1YTVhMjA4M2RkYjBlNDM4YmMyNjJhNTI1OWZiZGFmYmI1MDMifQ%3D%3D; laravel_session=eyJpdiI6ImhaN3pvd1RNeWRRZ0Ywbm85elJvbFhNenk4R3l5MFpDcWtvN2poM3hqcEE9IiwidmFsdWUiOiJIdkhqcjgxcGZUMFdaYnJBMFY4TXo0SFl5K2hqTklaQWpMMzVReTZjdmVcL0xuUTdmbXNcL01lXC9objZlSEIxVjQzV1Mwb3hHc3RqM1hObjBwQlZvTmVYdz09IiwibWFjIjoiODQwY2I4MzMzOWJjYmQzMzRhZmVhZDQ1YzBjODQ2ZDFlMmQxODBmYzJhOGE1MzQ3NThkMzQyOGI4N2NjZGFiNCJ9" forHTTPHeaderField:@"Cookie"];
        [manager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"lang"];
        [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Proxy-Connection"];
        [manager.requestSerializer setValue:@"@rWW6wQ+NR7xIET/rdOTzo7YVw07HpFWY53v4ZtdfgKlMpICb5fez7zJci0lvnxD5auhNsd9bYXM=" forHTTPHeaderField:@"UUID"];
        [manager.requestSerializer setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13F69 NewsApp/4.7.0 NetType/NA Technology/Wifi (iPhone; iOS 9.3.2; Scale/2.00) (modelIdentifier/iPhone8,4 )" forHTTPHeaderField:@"User-Agent"];
        [manager.requestSerializer setValue:@"ZpUDJ4pc8QuyckYG0C39qnKqiRICvxOI9Sxzbp8U3iWq0lUUFxCjpVMpJZd2JaNd" forHTTPHeaderField:@"Authorization"];
        [manager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"Accept-Language"];
        [manager.requestSerializer setValue:@"gzip,deflate" forHTTPHeaderField:@"Accept-Encoding"];
    });
    return manager;
}

+ (instancetype)sharedManagerAbsoluteUrl {
    static DQAFNetManager *manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        manager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@""]];
        manager.securityPolicy.allowInvalidCertificates = YES;
        manager.securityPolicy.validatesDomainName = NO;
        [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
        [manager.requestSerializer setValue:@"device_id=eyJpdiI6IkNsdjJhdUd4aVJYQlBha3d3cGl0dFdTbU00eU9vcXU2MFZONWlNNWNjbEE9IiwidmFsdWUiOiJDU2pYSEtsVUYrYm9hditXZk4zSnB6ZkFjZzdvM25JVHk0djZ6cjk5SVNVPSIsIm1hYyI6IjNiNThmZWYzMWRjMTk4YTkyMDM4YjYwNjRiNmM1YTVhMjA4M2RkYjBlNDM4YmMyNjJhNTI1OWZiZGFmYmI1MDMifQ%3D%3D; laravel_session=eyJpdiI6ImhaN3pvd1RNeWRRZ0Ywbm85elJvbFhNenk4R3l5MFpDcWtvN2poM3hqcEE9IiwidmFsdWUiOiJIdkhqcjgxcGZUMFdaYnJBMFY4TXo0SFl5K2hqTklaQWpMMzVReTZjdmVcL0xuUTdmbXNcL01lXC9objZlSEIxVjQzV1Mwb3hHc3RqM1hObjBwQlZvTmVYdz09IiwibWFjIjoiODQwY2I4MzMzOWJjYmQzMzRhZmVhZDQ1YzBjODQ2ZDFlMmQxODBmYzJhOGE1MzQ3NThkMzQyOGI4N2NjZGFiNCJ9" forHTTPHeaderField:@"Cookie"];
        [manager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"lang"];
        [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection"];
        [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Proxy-Connection"];
        [manager.requestSerializer setValue:@"@rWW6wQ+NR7xIET/rdOTzo7YVw07HpFWY53v4ZtdfgKlMpICb5fez7zJci0lvnxD5auhNsd9bYXM=" forHTTPHeaderField:@"UUID"];
        [manager.requestSerializer setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13F69 NewsApp/4.7.0 NetType/NA Technology/Wifi (iPhone; iOS 9.3.2; Scale/2.00) (modelIdentifier/iPhone8,4 )" forHTTPHeaderField:@"User-Agent"];
        [manager.requestSerializer setValue:@"ZpUDJ4pc8QuyckYG0C39qnKqiRICvxOI9Sxzbp8U3iWq0lUUFxCjpVMpJZd2JaNd" forHTTPHeaderField:@"Authorization"];
        [manager.requestSerializer setValue:@"zh-cn" forHTTPHeaderField:@"Accept-Language"];
        [manager.requestSerializer setValue:@"gzip,deflate" forHTTPHeaderField:@"Accept-Encoding"];
    });
    return manager;
}


-(instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        // 请求超时设定
        self.requestSerializer.timeoutInterval = 10;
        self.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [self.requestSerializer setValue:url.absoluteString forHTTPHeaderField:@"Referer"];
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
        self.securityPolicy.allowInvalidCertificates = YES;
    }
    return self;
}

- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure
{
//    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    MBProgressHUD* hud=[MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] getCurrentViewController].view animated:YES];
    hud.mode=MBProgressHUDModeIndeterminate;
    hud.removeFromSuperViewOnHide=YES;

    switch (method) {
        case GET:{
            [self GET:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
//                NSLog(@"JSON: %@", responseObject);
                success(responseObject);
//                [hud hide:YES];
                [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] getCurrentViewController].view animated:YES];
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                DQLog(@"Error: %@", error);
                failure(error);
                [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] getCurrentViewController].view animated:YES];
//                [hud hide:YES];
            }];
            break;
        }
        case POST:{
            [self POST:path parameters:params progress:nil success:^(NSURLSessionTask *task, NSDictionary * responseObject) {
                DQLog(@"JSON: %@", responseObject);
                success(responseObject);
            } failure:^(NSURLSessionTask *operation, NSError *error) {
                DQLog(@"Error: %@", error);
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:error.localizedDescription delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
                failure(error);
            }];
            break;
        }
        default:
            break;
    }    
}

@end
