module bar;
import baz;
import gen;

typedef int as Bob;




/*
func void testVararg(int foo, ... args)
{
    @args.start();
    int i = @args.next(i, int);
    @args.end();
}*/

/*
macro namespaceFor(ns; void(int i) $body)
{
    for (usize i = 0; i < ns.avail; i++)
    {
        @$body(i);
    }
}

macro usize nameHashFn(char *strp, usize strl)
{
    usize hash = 5381;
    for (usize i = 0; i < strl; i++)
    {
        hash = ((hash << 5) + hash) ^ cast(strp[i] as usize);
    }
    return hash;
}

macro INode *nodesGet(nodes as index)
{
    return cast(node + 1 as INode**)[index];
}

macro lexReturnPuncTok!(tok as skip as implicit lex, implicit srcp)
{
    lex.toktype = tok;
    lex.tokp = srcp;
    lex.srcp = srcp + skip;
    return;
}
*/
func int! testThrow4(int x)
{
    return x > 4 ? TestErr1! : TestErr2!;
}

struct Test
{
    int a;
}

struct Test2
{
    Test t;
    int b;
}

union Test3
{
    long eo;
    Test t;
    int b;
}

struct Teob
{
    int x;
    double y;
    int xy;
    int oekfeo;
}

enum EnumWithData : ushort (int a, char[] x, long b = 4)
{
    // Currently the args are ignored TODO!
    TEST1(42, "hello", 328) = 3,
    TEST2(12, "world")
}

enum EnumTestNoOverflowAfterULong : ulong
{
    VALUE = 0xFFFF_FFFF_FFFF_FFFE,
    VALUE_NO_EXCEED
}

$if (false) {

enum EnumTestOverflowAfterLong : long
{
    VALUE = 0x7FFF_FFFF_FFFF_FFFF,
    VALUE_EXCEED
}

enum EnumTestOverflowAfterULong : ulong
{
    VALUE = 0xFFFF_FFFF_FFFF_FFFF,
    VALUE_EXCEED
}

enum EnumTestOverflowAfter
{
    VALUE = 0x80000000 - 1,
    VALUE_EXCEED
}

}





struct TestStruct
{
    int a;
}

struct TestStruct2
{
    TestStruct a;
    char xx;
    TestStruct b;
    int c;
}

union TestUnion
{
    int a;
    double f;
    TestStruct2 e;
}
union SimpleUnion
{
    int a;
    double f;
}


func void testIf()
{

    int a = 0;
    int b = 1;
    if (a, b)
    {
        printf("Yes!\n");
    }
    if (int x = 0, int y = 2)
    {
        printf("Yes: %d/%d\n", x, y);
    }
    if (int x = 2, int y = 0)
    {
        printf("No: %d/%d\n", x, y);
    }
    int! z = 67;

    try (int j = z, int k = z + 1)
    {
        printf("Check: %d %d\n", j, k);
    }
    try (z)
    {
        printf("Show :%d", z);
    }
}


func void testPointer()
{
    int i = 0;
    int *x = &i;
    int y = x[2];
    *x;
}
func void testUnion()
{
    int wdw = 123;
    cast(wdw as long);
    wdw = 222;
    SimpleUnion s;
    s.a = 1;
    s.f = 1.0;
    s = { 1 };
    int x = 2;
    s = { (x = 2) };
    s = { f = 1.0 };
    TestUnion tu = { e = TestStruct2 { c = 1 } };
    tu.e = TestStruct2 {  c = 1 };


    SimpleUnion y = s = { 2 };
    double yval = SimpleUnion{ f = 3.333 }.f;
    printf("Union y: %d\n", y.a);
    printf("Union simple: %f\n", yval);
}

func TestStruct2 structTest(int i)
{
    TestStruct foo = { i };
    TestStruct foo2 = { a = i };
    TestStruct foo3 = TestStruct { i };
    TestStruct2 bar = { c = 2 };
    int x = 3 * i;
    TestStruct2 bar2 = { b.a = x, a.a = x + 1 };
    return bar2;
}


func void switchTest()
{

    switch FOO: (cast(1 as int))
    {
        case 1:
            printf("1\n");
            next FOO:3;
        case 2:
            printf("2\n");
            next 4;
        case 3:
            printf("3\n");
            next 2;
        case 4:
            printf("4\n");
    }
}

func int jumptest()
{

    do LABELX:
    {
        if (0) break LABELX;
        printf("Hello\n");
    };
    do LABELX:
    {
        if (1) break LABELX;
        return 1;
    } while(1);
    do LABELX:
    {
        if (1) continue LABELX;
        return 1;
    } while(0);

    return 2;
}
/*
func int! borok()
{
    return 1;
}*/




struct SimpleStruct
{
    int a;
    int b;
    double c;
    double d;
    char z1;
    char z2;
}
func void testSimpleStruct(int x)
{
    SimpleStruct snoinit;
    SimpleStruct sinit = { b = 1, d = 3.0, z1 = 1 };
    sinit.a = 1;
    sinit.b = 2;
    printf("Testing:\n");
    printf("a = %d, b = %d (2), c = %f, d = %f (3.0), z1 = %d (1), z2 = %d\n", sinit.a, sinit.b, sinit.c, sinit.d, cast(sinit.z1 as int), cast(sinit.z2 as int));
    if (sinit.a != 1) printf("ERROR a\n");
    if (sinit.b != 2) printf("ERROR b\n");
    if (sinit.d != 3.0) printf("ERROR d\n");
    if (sinit.z1 != 1) printf("ERROR z1\n");
    snoinit.b = 1;
    snoinit.a = 100;
    snoinit.d = 3.0;
    snoinit.c = 2.0;
    snoinit.z1 = 1;
    snoinit.z2 = 2;
    printf("b = %d (1), d = %f (3.0), z1 = %d (1)\n", snoinit.b, snoinit.d, snoinit.z1);
    if (snoinit.b != 1) printf("ERROR b\n");
    if (snoinit.d != 3.0) printf("ERROR d\n");
    if (snoinit.z1 != 1) printf("ERROR z1\n");
}

struct AnonStruct
{
    int a;
    struct xx
    {
        int b;
        int c;
    }
    struct
    {
        int b1;
        int c1;
    }
    union
    {
        int b2;
        int c2;
    }
    int x;
}

func AnonStruct sendAnonStruct()
{
    AnonStruct foo = AnonStruct { a = 1 };
    // Foo { a = 1 }
    foo.b2 = 123;
    return foo;
}

func void testAnonStruct2()
{
    sendAnonStruct();
}


func void testAnonStruct()
{

    AnonStruct s = { b2 = 3, b1 = 7, xx.b = 1 };
    AnonStruct foo;

    if (s.a != 0) printf("Error s.a\n");
    if (s.x != 0) printf("Error s.x\n");
    if (s.xx.b != 1) printf("Error s.xx.b = %d\n", s.xx.b);
    if (s.xx.c != 0) printf("Error s.xx.c\n");
    if (s.b1 != 7) printf("Error s.b1\n");
    if (s.c1 != 0) printf("Error s.c1\n");
    if (s.b2 != 3) printf("Error s.b2\n");
    if (s.c2 != 3) printf("Error s.c2\n");

    s.xx.b = 100;
    s.xx.c = 99;
    s.b1 = 3;
    s.b2 = 5;
    s.c2 = 7;

    if (s.a != 0) printf("Error s.a\n");
    if (s.x != 0) printf("Error s.x\n");
    if (s.xx.b != 100) printf("Error s.xx.b = %d\n", s.xx.b);
    if (s.xx.c != 99) printf("Error s.xx.c\n");
    if (s.b1 != 3) printf("Error s.b1\n");
    if (s.c1 != 0) printf("Error s.c1\n");
    if (s.b2 != 7) printf("Error s.b2\n");
    if (s.c2 != 7) printf("Error s.c2\n");

    s = { xx = { c = 2 }};

    if (s.a != 0) printf("Error s.a\n");
    if (s.x != 0) printf("Error s.x\n");
    if (s.xx.b != 0) printf("Error s.xx.b = %d\n", s.xx.b);
    if (s.xx.c != 2) printf("Error s.xx.c\n");
    if (s.b1 != 0) printf("Error s.b1\n");
    if (s.c1 != 0) printf("Error s.c1\n");
    if (s.b2 != 0) printf("Error s.b2\n");
    if (s.c2 != 0) printf("Error s.c2\n");

    s.xx.c = 3;
    s.x = 1212;
    s.a = 29183;
    s = AnonStruct { xx = { c = 2 }};

    if (s.a != 0) printf("Error s.a\n");
    if (s.x != 0) printf("Error s.x\n");
    if (s.xx.b != 0) printf("Error s.xx.b = %d\n", s.xx.b);
    if (s.xx.c != 2) printf("Error s.xx.c\n");
    if (s.b1 != 0) printf("Error s.b1\n");
    if (s.c1 != 0) printf("Error s.c1\n");
    if (s.b2 != 0) printf("Error s.b2\n");
    if (s.c2 != 0) printf("Error s.c2\n");

    s = sendAnonStruct();

    if (s.a != 1) printf("Error s.a\n");
    if (s.x != 0) printf("Error s.x\n");
    if (s.xx.b != 0) printf("Error s.xx.b = %d\n", s.xx.b);
    if (s.xx.c != 0) printf("Error s.xx.c\n");
    if (s.b1 != 0) printf("Error s.b1\n");
    if (s.c1 != 0) printf("Error s.c1\n");
    if (s.b2 != 123) printf("Error s.b2\n");
    if (s.c2 != 123) printf("Error s.c2\n");

}
func int boba(int y, int j)
{
//    hello();
    //$e = type(Teob);
    //Teob xbd = type(Teob);
    //Teob xb = { 1, 1.0, 100, 1000 };
    //Test2 tee = { { 3 }, 4 };
    //Test3 xc = { eo = 1, t.a = 1 };
   // throw Error.NO_SUCH_FILE;


    Test2 bar;
    bar.b = 1;
    //int w = y ? y : j;
    int x = y * 2;
    int z = j;
    while (j > 10)
    {
        z--;
        x = x + z * 2;
    }
    return x;
}
func int test(int x = 100)
{
    x = x + 1;
    x = x +% 1;
    x += 1;
    x +%= 1;
    Test3 foekf;
    Test oef;
    Test2 foek;
    int i = x;
    Bob foo = x;
    Bob fe = 0;
    fe++;
    switch (fe + 1)
    {
        case 1:
            i = i + 1;
            next;
        case 3:
        case 2:
            i = i + 2;
        case 5:
        default:
            i = i * 100;
        case 7:
    }
    i++;
    int y = i--;
    return y;
}



func int test3()
{
    if (test() < 0) return -1;
    return 5;
}

typedef func void() as FEok;

typedef func void(int) as Foo;
//typedef int as Foo;
extern func void printf(char *hello, ...);

macro hello()
{
    printf("Hello world!\n");
}

func void bob()
{

    byte a = 2;
    short b = 3;
    int c = 4;
    bool eok = true;
    long deee = (eok ? a : b) + c;
}

func int if_test(int x)
{
    switch (x)
    {
        case 1:
            x += 1;
            if (x < 10)
            {
                defer x += 5;
                if (x < 7)
                {
                    defer x += 100;
                    next;
                }
                x += 99;
            }
            next;
        default:
            x += 2;
            break;
    }
    return 1;
}
func int yyyy(int x)
{
    defer printf("A");
    if (x > 0) return 2;
    defer printf("B");
    printf("C");
    return 1;
}

func void zzzz()
{
    int x = 0;
    defer
    {
        x += 1;
        printf("A");
    }
    defer
    {
        x += 2;
        printf("B");
    }
    printf("C");
    x += 3;
}

func void test_expr_block(int x)
{
    int a = ({
        if (x > 0) return x * 2;
        if (x == 0) return 100;
        return -x;
    });
    printf("The result was %d\n", a);
}

func int expr_block()
{
    int fok = ({ return ({ return 10; }); });
    int y = 2;
    int x = ({
        if (y < 10) return 10;
        return 2;
    });

  /*  ({
        return 3;
    });*/
    return x;

}
func int xxxx(int x)
{


    do LABELD:
    {
        x += 10;
        defer printf("XXX");
        if (x < 100) break LABELD;
        defer printf("EODfe");
    };
    {
        defer printf("Defer says hello!\n");
        x--;
    }
    return 1;
}

func int testPointers(int x, int j = 0, double foo = 3.2)
{
    1 ? 1 : 2;
    int y = 0;
    int* z = &y;
    int d = *(z + y);
    isize e = z - &y;
    int* eff = &y + 1;
    short x1 = 2;
    float f = x1 +% x1 + 1.0;
    float f2 = x1 -% x1 + 1.0;
    usize ef = z - &y > 0 ? 1 : z - &y;
    z - &y > 0 ? 1 : z - &y;
    return 1;
}

func void testDefault(int x = 2, int y = 100, int z = -100)
{
    printf("x = %d, y = %d, z = %d\n", x, y, z);
}

int foofei = 3;

func int testReturnDefer()
{
    int i = 0;
    foofei++;
    i++;
    defer ++i;
    return i;
}

struct WithArray
{
    int[4] x;
}

error TestErr1;
error TestErr2;

func void testErr1()
{

}

struct Feok
{
    long a;
    long b;
    long c;
}

error FooErr
{
    int x;
    int y;
}

func int! testThrow1()
{
    return TestErr1!;
}


func int frob(int i)
{
    return i * i;
}


func void show()
{
    int! num = 3;
    num = frob(num + 1);
    printf("Num: %d\n", num);
}
func void! testAllErrors()
{

    printf("Try test all\n");
    int! i = 7;
    int*! iptr = &i;
    int* xd = iptr!!;
    printf("%d\n", *xd);
    int**! iptrptr = &iptr;
    catch (err = iptrptr)
    {
        printf("Unexpected error!\n");
    }
    catch (i = **iptrptr)
    {
        printf("Unexpected error!\n");
    }
    bool! hej = (i + 1);
    try (hej)
    {
        printf("Was clean!\n");
    }
    i = TestErr1!;
    hej = (i + 1);
    catch (hej) printf("Not clean!\n");
    i = 2938;
    try(i) printf("Fine? %d\n", i);
    catch(i) printf("Not fine\n");
    try (int j = i)
    {
        printf("Gotcha %d\n", j);
    }
    int hupp = 3;
    iptr = &hupp;
    iptr = TestErr1!;
    catch (err = *iptr)
    {
        printf("Expected error!\n");
    }

    i = 2;
    Feok z;
    z.a = 1;
    Feok! x = z;
    int! j;
    j = i;
    j = TestErr1!;
    FooErr fex = FooErr { 1, 3 };
    fex.x = 2;
    printf("Fex: %d\n", fex.x);
    error test33 = fex;
    FooErr fex2 = cast(test33 as FooErr);
    printf("Fex2: %d\n", fex.x);
    TestErr1 eok = TestErr1{};
    error e = eok;
    catch (err = x)
    {
        printf("Error!\n");
    }
    catch (err = j)
    {
        case FooErr:
            printf("FooErr\n");
        case TestErr1:
            printf("TestErr1\n");
        default:
            printf("Default error!\n");
    }
    printf("No error!\n");
    int! flow = 1;
    catch (flow) return;
    int xy = flow;

    catch (err = i) return;
    if (i > 0)
    {
        printf("Ok!\n");
    }
    i = TestErr1!;
/* Error    if (i > 0)
    {
        printf("Not ok!\n");
    }*/

}





func int! testThrow6(int x)
{
    if (x > 4) return TestErr1!;
    return TestErr2!;
}


func int! testThrow(int x)
{
    throwsDone.times++;
    if (x < 0) return TestErr1!;
    return x * x;
}
func int! oekt()
{
    int z = testThrow(-1) else return 1;
    printf("Skipped.\n");
    int! x = testThrow(-3);
    catch (err = x)
    {
//        printf("An error %p\n" as cast(err as usize));
        return err!;
    }
    return x;
}
func int! testThrowAny(int x)
{
    if (x < 0) return TestErr1!;
    return x * x;
}
func void testErrorBug()
{
    printf("Test error multi\n");
    printf("Will call\n");
    catch(oekt())
    {
        case TestErr1:
            printf("Expected particular error.\n");
        default:
            error foo = TestErr2{};
            //printf("Not expected %p != %p\n" as cast(e as usize) as cast(foo as usize));
            printf("Unexpected any error error.\n");
    }
    printf("End\n");
}
func void testErrorMulti()
{
    defer printf("End defer\n");
    int! z;
    printf("Test error multi\n");
    {
        defer printf("Defer\n");
        printf("Will call\n");
        z = oekt();
        printf("Got here\n");
    }
    catch (e = z)
    {
        case TestErr1:
            printf("Expected particular error.\n");
        default:
            error foo = TestErr1{};
//            printf("Not expected %p != %p\n" as cast(e as usize) as cast(foo as usize));
            printf("Unexpected any error error.\n");
    }
    printf("End\n");
}

func void! throwAOrB(int i)
{
    printf("AB\n");
    defer printf("A-Err\n");
    if (i == 1) return TestErr1!;
    printf("B\n");
    defer printf("B-Err\n");
    if (i == 2) return TestErr2!;
    printf("None\n");
}

struct ThrowsDone
{
    long x;
    long y;
    long z;
    int times;
}
ThrowsDone throwsDone;

func void testErrors()
{

    printf("Throws: %d\n", throwsDone.times);

    int x = testThrow(20) else 1;
    printf("Value was %d, expected 400.\n", x);

    printf("Throws: %d\n", throwsDone.times);

    x = testThrow(-1) else 20;
    printf("Value was %d, expected 20.\n", x);

    printf("Throws: %d\n", throwsDone.times);

    printf("Begin\n");
    int! y = testThrow(-1);

    try (y)
    {
        printf("Value was %d, expected 9.\n", y);
        printf("Didn't expect this one.\n");
    }
    catch(y)
    {
        printf("Expected this catch.\n");
    }

    y = testThrow(-1);
    catch (y)
    {
        printf("Particular error.\n");
    }
    testErrorMulti();

    catch (throwAOrB(1))
    {
        case TestErr1:
            printf("A1\n");
        case TestErr2:
            printf("A2\n");
    }
    catch (throwAOrB(2))
    {
        case TestErr1:
            printf("B1\n");
        case TestErr2:
            printf("B2\n");
    }
    printf("Throws: %d\n", throwsDone.times);
    printf("End of errors\n");
}

macro void arrayCallMacro($x)
{
    printf("Array call: %d, %d\n", $x[0], $x[1]);
}

typedef func int(int) as IntInt;

func int funcTest(int i)
{
    return i * i;
}

func void testFuncPointer()
{
    IntInt bobd =  &funcTest;
    int x = bobd(2);
    printf("Func test: %d\n", x);
    printf("Func test: %d\n", bobd(100));
}

func void arrayCall(int[2] x) @inline @weak @align(16) @cname("Foo")
{
    printf("Array call: %d, %d\n", x[0], x[1]);
}
func void testArray()
{
    int[4] zebra = { [2] = 1 };
    int[4] deok = { 1, 5, 9, 16 };
    int[] sa = &deok;
    int* sp = sa;
    WithArray boo;
    boo.x[0] = 2;
    printf("boo.x[0] = %d\n", boo.x[0]);
    printf("boo.x[2] = %d\n", boo.x[2]);
    printf("sa[2] = %d\n", sa[2]);
    printf("sa[3] = %d\n", sa[3]);
    deok[2] = 100;
    sa[1] = 999;
    printf("sa[2] = %d\n", sa[2]);
    printf("sp[2] = %d\n", sp[2]);
    printf("deok[1] = %d\n", deok[1]);
    int[2] two = { 142, 2 };
    arrayCall(two);
    //@arrayCallMacro(two);
    int[4] x;
    x[1] = 1;
    x[0] = 3;
    int y = x[1];
    int z = 1;
    int* b = &z;
    printf("b: %d\n", *b);
    *b = 3;
    printf("b: %d\n", *b);
    printf("z: %d\n", z);

    for (int i = 0; i < 4; i++)
    {
        printf("x[%d] = %d\n", i, x[i]);
    }

}

func void testDefer()
{
    printf("1 == %d\n", testReturnDefer());
    printf("1");
    defer printf("8\n");
    printf("2");
    {
        printf("3");
        defer printf("5");
        printf("4");
    }
    int i = 0;
    defer printf("-JUMPDEFER-");
    switch (int boo = 2)
    {
        case 0:
            printf("\n0\n");
        case 2:
            defer printf("*CaseDefer*");
            printf("-Case2-");
        default:
            break;
    }
    defer printf("7");
    printf("6");
}

func void testType()
{
    printf("Test type\n");
    typeid x = WithArray.typeid;
    int y = 0;
    Teob b;
    typeid structSize = typeof(b);
}

struct Big
{
    long x;
    long y;
    long z;
}
func Big testStructReturn()
{
    return Big { 1, 2, 3};
}

func void testExprBlock()
{
    printf("ExprBlock\n");
    int x = ({
        int y = 1;
        for (int i = 0; i < 100; i++)
        {
            printf("%d\n", i);
            if (y % 3 == 0 && y % 2 == 0) return y;
            y++;
        }
        return 100;
    });
    printf("Was %d\n", x);
}

typedef func int(int) as Blorb;

func int eokf(int x)
{
    return x * x + 1;
}

func void Big.init(Big* big)
{
    big.x = 1;
    big.y = 2;
    big.z = 3;
}
func void Big.mult(Big* big, int x)
{
    big.x *= x;
    big.y *= x;
    big.z *= x;
}

struct Bork
{
    Big x;
    Big y;
}
func void testMethodFunctions()
{
    Big b;
    b.init();
    printf("%d %d %d\n", b.x, b.y, b.z);
    b.mult(3);
    printf("%d %d %d\n", b.x, b.y, b.z);
    Bork x;
    x.x.init();
    x.x.mult(4);
    printf("%d %d %d\n", x.x.x, x.x.y, x.x.z);
}

enum TestEnumSize : ushort
{
    BLURB
}

enum TestEnumSizeDefault
{
    BLURB
}

struct TestStructSize
{
    char x;
    long y;
}

struct TestStructInt
{
    int a;
    int b;
    int c;
}

union TestUnionSize
{
    short a;
    int b;
    char[5] c;
}
func void testTypeValues()
{
    printf("Enum size: %d = 2\n", TestEnumSize.sizeof);
    printf("Enum size: %d = 4\n", TestEnumSizeDefault.sizeof);
    printf("Struct size: %d = 12\n", TestStructInt.sizeof);
    printf("Struct size: %d = 16\n", TestStructSize.sizeof);
    printf("Union size: %d = 5\n", TestUnionSize.sizeof);
}

func int testTypeofHelp()
{
    return 2;
}

func void testTypeof()
{
    typeid y = typeof(1 + testTypeofHelp());
}

macro void printMessage($x)
{
    for (int i = 0; i < $x; i++)
    {
        printf("print message! %d\n", i);
    }
    $x = $x + 1;
}

func void testMacros()
{
    int i = 3;
    @printMessage(i);
    printf("i: %d\n", i);
}

/*
const char[] LUT_ENC = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
    'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
    'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
    'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3',
    '4', '5', '6', '7', '8', '9', '+', '/',
};
*/
//const byte ERR = 0xFF;

/*
const byte[256] LUT_DEC = {
    // '+', ',', '-', '.', '/', '0', '1', '2'
        62, ERR, ERR, ERR, 63,  52,  53,  54,
    // '3', '4', '5', '6', '7', '8', '9', ':'
        55,  56,  57,  58,  59,  60,  61, ERR,
    // ';', '<', '=', '>', '?', '@', 'A', 'B'
        ERR, ERR, ERR, ERR, ERR, ERR,  0,  1,
    // 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'
         2,   3,   4,   5,   6,   7,   8,   9,
    // 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R'
        10,  11,  12,  13,  14,  15,  16,  17,
    // 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
        18,  19,  20,  21,  22,  23,  24,  25,
    // '[', '\', ']', '^', '_', '`', 'a', 'b'
       ERR, ERR, ERR, ERR, ERR, ERR,  26,  27,
    // 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'
        28,  29,  30,  31,  32,  33,  34,  35,
    // 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r'
        36,  37,  38,  39,  40,  41,  42,  43,
    // 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
        44,  45,  46,  47,  48,  49,  50,  51,
};
*/
/*
const char PAD = '=';
const char FIRST = '+';
const char LAST = 'z';
*/
public error InvalidCharacterError;

/*
public func void encode(byte[] infile, char[] *out)
{
	int j = 0;

    for (int i = 0; i < i.len; i++);
	{
        switch (i % 3)
        {
            case 0:
                out[j++] = LUT_ENC[(infile[i] >> 2) & 0x3F];
            case 1:
                out[j++] = LUT_ENC[(infile[i-1] & 0x3) << 4 + ((infile[i] >> 4) & 0xF)];
            case 2:
                out[j++] = LUT_ENC[(infile[i-1] & 0xF) << 2 + ((infile[i] >> 6) & 0x3)];
                out[j++] = LUT_ENC[infile[i] & 0x3F];
        }
        i++;
	}

    // move back
    int last = infile.len - 1;

    // check the last and add padding
    switch (last % 3)
    {
        case 0:
            out[j++] = LUT_ENC[(infile[last] & 0x3) << 4];
            out[j++] = PAD;
            out[j++] = PAD;
        case 1:
            out[j++] = LUT_ENC[(infile[last] & 0xF) << 2];
            out[j++] = PAD;
    }
}

public func int! decode(char[] infile, byte[] out)
{
    int j = 0;

    for (int i = 0; i < len; i++)
    {
        char value = infile[i];

        if (value == PAD) return j;

        if (value < FIRST || infile[i] > LAST) return InvalidCharacterError!;
        byte c = LUT_DEC[infile[i] - FIRST];
        if (c == ERR) return InvalidCharacterError!;

        switch (i % 4)
        {
            case 0:
                out[j] = c << 2;
            case 1:
                out[j++] += (c >> 4) & 0x3;
                // if not last char with padding
                if (i < (len - 3) || infile[len - 2] != PAD)
                {
                    out[j] = (c & 0xF) << 4;
                }
            case 2:
                out[j++] += (c >> 2) & 0xF;
                if (i < (len -2) || infile[len -1] != PAD)
                {
                    out[j] = (c & 0x3) << 6;
                }
            case 3:
                out[j++] += c;
        }
    }
    return j;
}
*/

func int main(int x)
{
    if (x < 0) printf("Hello\n");
    if (x
    < 0) printf("Hello\n");

    int[6] feok2 = { 1, 8, 100, 293, 23982, 34};
    int[] feok = &feok2;
    int[] flok = feok2[3..6];
    int[] flak = flok[1..2];
    printf("HEllo\n");
    printf("Feok: %d\n", feok[0]);
    printf("Feok: %d\n", feok[1]);
    printf("Len: %d\n", feok.len);
    printf("Len: %d\n", feok2.len);
    printf("Len: %d\n", flok.len);
    printf("Flok: %d\n", flok[0]);
    printf("Flak: %d\n", flak[0]);
    printf("Len: %d\n", flak.len);
    feok2[1..^2] = 0xAA;
    printf("Flok[0]: %d\n", flok[0]);
    printf("Flok[1]: %d\n", flok[1]);
    printf("Flok[2]: %d\n", flok[2]);
    printf("Feok[0]: %d\n", feok[0]);
    printf("Feok[1]: %d\n", feok[1]);
    printf("Feok[2]: %d\n", feok[2]);
    for (int ef = 0; ef < 6; ef++)
    {
        printf("feok2[%d] = %d\n", ef, feok2[ef]);
    }
    baz::runBaz();
    show();
    testMacros();
    testTypeof();
    testAllErrors();
    //testErrorBug();
    //testErrors();
    testDefault(y = 99);
    testPointers(2, 3);
    testDefer();
    testArray();
    testAnonStruct();
    testSimpleStruct(0);
    testUnion();
    testType();
    testExprBlock();
    testFuncPointer();
    testMethodFunctions();
    testTypeValues();
    int efd = 9;

    uint fefoek = 1;
    testIf();
    printf("Helo: %d\n", efd + cast(fefoek as int));
    //long fefoek = -fefoek;
    int okfe = 1;
    return 1;
    switch (int bobe = okfe > 0 ? 1 : 0)
    {
        case 0:
            defer printf("case0-\n");
        case 1:
            printf("case 1\n");
            defer printf("case1-\n");
            if (efd < 10)
            {
                {
                defer printf("ef < 10\n");
                if (efd < 7)
                {
                    defer printf("ef < 7\n");
                    next;
                }
                }
            }
            next;
        case 1000 >> 2:
            printf("case 1000 >> 2\n");
        case (1 << 200) >> 197:
            printf("case 1 << 3\n");
        default:
            printf("default\n");
    }
    int aa = x++;
    int bb = x--;
    int cc = ++x;
    for (int ok = 0; ok < 10; ok++)
    {
        printf("ok");
    }
    printf("\n");
    for (int ok = 0, int ko = 0, ok = 2; ok + ko < 10; ok++, ko++)
    {
        printf(":okko");
    }
    printf("\n");
    int ok = 0;
    while (int j = ok++, ok < 10)
    {
        printf("foo");
    }
    printf("\n");
    x = 3;
    if (int odk = x, x > 0)
    {
        printf("helo\n");
    }
    Test baok = { 1 };
    Test2 efe;
    efe.t.a = 3;
    if (efe.t.a > 2) printf("Works!\n");
    int ef = 3;
    int *eff = &ef;
    eff[0] = 4;
    byte *ex = cast(eff as byte*);
    ex[0] = 5;
    if (eff[0] == 5) printf("Works-5!\n");
    ex[1] = 5;
    if (eff[0] == 5 + 5 * 256) printf("Works-5*256!\n");
    if (ef == 4) printf("Works5!\n");
    if (ef == 4) printf("Works1!\n");
        ef = 0;

    byte a = 2;
    short b = 3;
    int c = 4;
    bool eok = true;
    long deee = (eok ? a : b) + (eok ? b : c);
int i = 0;

    do JUMP:
    {
        i = i + 1;
        //@hello();
        printf("Hello worldABC" "D" "E\u2701\n");
        float f = 3.0;
        float* pf = &f;
        switch (i)
        {
            case 0:
                printf("c0\n");
           case 1:
                printf("c1\n");
            case 2:
                printf("c2\n");
            case 3:
                printf("c3\n");
            default:
                printf("default\n");
        }
        if (*pf > i) continue JUMP;
        break JUMP;
    } while (1);

    return 1;
}

func void teeeest()
{
    long z = 3;
    (1 ? (z < 1 ? 2 : 1) : 3) == 3;
    (1 ?: (z ?: 7)) == 4;
    (1 ?: (3 ?: 7)) == 4;
}
func void test2(int* x, int y, int z)
{
    *(&(&x)[0]);
    float cheat = cast(x as int);

    x++;
    z = 0;
    z ? y : z;
    x += 1;
    y += z;
    x -= 1;
    y -= z;
    y *= 2;
    y /= 2;
    y /= *x;
    y |= 2;
    y ^= 2;
    y &= 2;
    z ^ y;
    z | y;
    int g = z & y;
    g <<= 2;
    g <<= z;
    g >>= 2;
    g >>= z;
    2 << g;
    3 >> 4;
    int fz = 100;
    y && z;
    y || z;
    y >> z;
    z << y;
    ~z;
    !z;
    -z;
    int i = 3;
    uint ui = 2;
    int j = 129;
    float f = 23.2;
    f = f + 1.0;
    f = f - 1.0;
    f = f * 2.0;
    f = f / 3.0;
    i = i * 2;
    ui = ui * 2;
    i = i / 2;
    ui = ui / 2;
    i = i + 1;
    ui = ui + 1;
    i = i - 1;
    ui = ui - 1;
    x + 1;
    int j1 = x[0];
    j1 = *x;
}

func void testBreak()
{

    defer printf("ALL TESTS DONE\n");
    int i = 0;
    int j = 0;
    while (j < 2)
    {
        defer printf("Defer while %d\n", j);
        break;
        defer printf("Exit\n");
    }
    do
    {
        defer printf("Defer do %d\n", j);
        break;
        defer printf("Exit\n");
    } while (j < 2);

    for (j = 0; j < 2; j++)
    {
        defer printf("Defer for %d\n", j);
        break;
        defer printf("Exit\n");
    }

    while (j < 2)
    {
        defer printf("Defer while %d\n", j);
        j++;
        continue;
        defer printf("Exit\n");
        printf("ERROR\n");
    }
    do
    {
        defer printf("Defer do %d\n", j);
        j++;
        continue;
        defer printf("Exit\n");
        printf("ERROR\n");
    } while (j < 2);

    for (j = 0; j < 2; j++)
    {
        defer printf("Defer for %d\n", j);
        continue;
        defer printf("Exit\n");
        printf("ERROR\n");
    }

    if FOO: (i == 0)
    {
        printf("Enter if\n");
        i++;
        defer("EXIT_FOO\n");
        while BAZ: (1)
        {
            defer("EXIT_BAZ\n");
            if BAR: (i > 0) break FOO;
        }
        printf("WRONG\n");
    }
    printf("Test done\n");

    while (i < 10)
    {
        i++;
        if (i % 2 == 0) continue;
        printf("%d\n", i);
        if (i > 6) break;
    }

    i = 0;
    j = 0;
    while FOO: (i < 10)
    {
        i++;
        j = 0;
        while (j < 3)
        {
            j++;
            printf("%d, %d\n", i, j);
            if ((i + j) % 3 == 0) continue FOO;
            if (i + j > 8) break FOO;
        }
    }
    i = 0;
    do
    {
        i++;
        if (i % 2 == 0) continue;
        printf("%d\n", i);
        if (i > 6) break;
    } while (i < 10);

    i = 0;
    do FOO:
    {
        i++;
        j = 0;
        while (j < 3)
        {
            j++;
            printf("%d, %d\n", i, j);
            if ((i + j) % 3 == 0) continue FOO;
            if (i + j > 8) break FOO;
        }
    } while (i < 10);

    i = 0;
    switch (i)
    {
        case 0:
            printf("case0\n");
            break;
            printf("ERROR\n");
        case 1:
            printf("ERROR\n");
    }

    printf("TestFor\n");
    for (i = 0; i < 15; i++)
    {
        for (j = 0; j < 3; j++)
        {
            printf("%d, %d\n", i, j);
            if ((i + j) % 3 == 0) continue;
            if (i + j > 8) break;
        }
    }

    printf("TestFor2\n");
    for FOO: (i = 0; i < 12; i++)
    {
        for (j = 0; j < 3; j++)
        {
            printf("%d, %d\n", i, j);
            if ((i + j) % 3 == 0) continue FOO;
            if (i + j > 8) break FOO;
        }
    }
    printf("Test1\n");
    i = 0;
    switch FOO: (i)
    {
        case 0:
            defer printf("Test1DeferOuter\n");
            while (1)
            {
                printf("case0\n");
                defer printf("Test1DeferInner\n");
                break FOO;
            }
            printf("ERROR\n");
        case 1:
            printf("ERROR\n");
    }
    printf("Test2\n");
    switch FOO: (i)
    {
        case 0:
            printf("case0\n");
            defer printf("Test2DeferNext\n");
            next;
        case 1:
            defer printf("Test2DeferCase\n");
            printf("case1\n");
    }
    printf("Test3\n");
    switch FOO: (i)
    {
        case 0:
            defer printf("Test3DeferNext\n");
            printf("case0\n");
            next 2;
        case 1:
            defer printf("Test3DeferErr\n");
            printf("case1\n");
        case 2:
            defer printf("Test3DeferCase\n");
            printf("case2\n");
    }
    printf("Test4\n");
    switch FOO: (i)
    {
        case 0:
            printf("case0\n");
            defer printf("OuterDefer\n");
            switch (i)
            {
                case 0:
                    printf("Inner\n");
                    defer printf("InnerDefer\n");
                    next FOO:2;
                case 2:
                    printf("ERROR\n");
            }
            next 1;
        case 1:
            printf("case1\n");
        case 2:
            defer printf("Case2Defer\n");
            printf("case2\n");
    }
    printf("Test5\n");
    switch FOO: (i)
    {
        case 0:
            defer printf("DEFER\n");
            printf("case0\n");
            switch (i)
            {
                case 0:
                    printf("Inner\n");
                    defer printf("DEFERINNER\n");
                    int k = 1;
                    next FOO: k;
                case 2:
                    printf("ERROR\n");
            }
            next 1;
        case 1:
            printf("case1\n");
        case 2:
            printf("case2\n");
    }

    i = 0;
    switch FOO: (i)
    {
        case 0:
            printf("0: %d\n", i);
            i++;
            next i;
        case 1:
            i += 2;
            defer printf("DEFER1\n");
            printf("1: %d\n", i);
            next i;
        case 2:
            printf("2: END\n", i);
        case 3:
            i--;
            printf("3: %d\n", i);
            next i;
        default:
            printf("WAAAIT\n");
    }
}