#import <Foundation/Foundation.h>

static NSArray<NSString *> *allowedHosts;

@interface Package : NSObject
- (void)setDepiction:(NSString *)v1;
- (void)setLegacyDepiction:(NSString *)v1;
- (NSString *)depiction;
- (NSString *)legacyDepiction;
@end

%hook Package

- (NSString *)depiction {
	NSLog(@"UwU");
	if (!(%orig) && self.legacyDepiction) {
		NSURL *legacyURL = [NSURL URLWithString:self.legacyDepiction];
		if (legacyURL && [allowedHosts containsObject:legacyURL.host]) {
			NSString *percentEncodedURL = [self.legacyDepiction stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
			NSString *finalRawURL = [NSString stringWithFormat:@"https://www.ios-repo-updates.com/api/sileo-depiction/?depiction=%@", percentEncodedURL];
			self.depiction = finalRawURL;
		}
	}
	return %orig;
}

%end

%ctor {
	allowedHosts = @[
		@"repo.packix.com",
		@"moreinfo.thebigboss.org",
		@"moreinfo.bigboss.org"
	];
}