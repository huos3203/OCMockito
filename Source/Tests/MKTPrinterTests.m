//  OCMockito by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2015 Jonathan M. Reid. See LICENSE.txt

#import "MKTPrinter.h"

#import "DummyObject.h"
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>


@interface MKTPrinterTests : XCTestCase
@end

@implementation MKTPrinterTests
{
    MKTPrinter *sut;
}

- (void)setUp
{
    [super setUp];
    sut = [[MKTPrinter alloc] init];
}

- (void)tearDown
{
    sut = nil;
    [super tearDown];
}

- (void)testPrintInvocation_MethodWithNoArgs
{
    NSInvocation *invocation = [DummyObject invocationWithSelector:@selector(methodWithNoArgs)];

    NSString *result = [sut printInvocation:invocation];
    
    assertThat(result, is(@"methodWithNoArgs"));
}

- (void)testPrintInvocation_DifferentMethodWithNoArgs
{
    NSInvocation *invocation = [DummyObject invocationWithSelector:@selector(differentMethodWithNoArgs)];

    NSString *result = [sut printInvocation:invocation];

    assertThat(result, is(@"differentMethodWithNoArgs"));
}

- (void)testPrintInvocation_MethodWithOneArgument
{
    NSInvocation *invocation = [DummyObject invocationWithObjectArg:@12.34];

    NSString *result = [sut printInvocation:invocation];

    assertThat(result, is(@"methodWithObjectArg:@12.34"));
}

- (void)testPrintInvocation_MethodWithTwoArguments
{
    NSInvocation *invocation = [DummyObject invocationWithObjectArg1:@12.34 objectArg2:@56];

    NSString *result = [sut printInvocation:invocation];

    assertThat(result, is(@"methodWithObjectArg1:@12.34 objectArg2:@56"));
}

@end
