//
//  DownloadsViewController.m
//

#import "DownloadsViewController.h"
#import "AFHTTPSessionManager.h"
#import "UIProgressView+AFNetworking.h"

@implementation DownloadsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startDownload];
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)startDownload
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration backgroundSessionConfiguration:@"Downloads"];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunesconnect.apple.com/downloads/Documentation/AppTransferTutorial.mov?itcKey=1400686864_f4496d605f190f230687304aeeff494e"]];
    
    NSURLSessionDownloadTask *task =
    [manager downloadTaskWithRequest:request
                         progress:nil
     destination:^NSURL *(NSURL *targetPath, NSURLResponse *response)
     {
         return nil;
     }
     completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error)
     {
         
     }
     ];
    [task resume];
    [self.progressView setProgressWithDownloadProgressOfTask:task animated:YES];
}

@end