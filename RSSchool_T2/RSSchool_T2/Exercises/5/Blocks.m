#import "Blocks.h"

@implementation Blocks

- (instancetype)init {
    
    __block Blocks *weakSelf = self;
    __block NSArray *objects;
    
    self.blockA = ^(NSArray *array) {
        objects = array;
    };
    
    self.blockB = ^(Class clazz) {
        [weakSelf retain];
        
        if (clazz == [NSString class]) {
            NSMutableString *result = [NSMutableString new];
            for (NSObject *obj in objects) {
                if ([obj isKindOfClass:[NSString class]]) {
                    [result appendString:obj];
                }
            }
            weakSelf.blockC(result);
        }
        
        if (clazz == [NSNumber class]) {
            int result = 0;
            for (NSObject *obj in objects) {
                if ([obj isKindOfClass:[NSNumber class]]) {
                    result += [(NSNumber *) obj intValue];
                }
            }
            weakSelf.blockC(@(result));
        }
        
        if (clazz == [NSDate class]) {
            NSDate *laterDate = [NSDate new];
            for (NSObject *obj in objects) {
                if ([obj isKindOfClass:[NSDate class]]) {
                    NSDate *tmpDate = obj;
                    if ([tmpDate timeIntervalSinceReferenceDate] > [laterDate timeIntervalSinceReferenceDate]) {
                        laterDate = tmpDate;
                    }
                }
            }
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            dateFormatter.dateFormat = @"dd.MM.yyyy";
            weakSelf.blockC([dateFormatter stringFromDate:laterDate]);
            [dateFormatter release];
        }
        
        
        [weakSelf release];
    };
    
    return self;
}

- (void) dealloc {
    [_blockA release];
    [_blockB release];
    [_blockC release];
    [super dealloc];
}
@end
