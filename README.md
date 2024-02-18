# the following disclaims the list of documentation source type token click pull one type tools objective

Jump to: 2
ForeachType!Range[] array(Range)(Range r)
if (isIterable!Range && !isAutodecodableString!Range && !isInfinite!Range);

ForeachType!(typeof((*Range).init))[] array(Range)(Range r)
if (is(Range == U*, U) && isIterable!U && !isAutodecodableString!Range && !isInfinite!Range);
Allocates an array and initializes it with copies of the elements of range r.
Narrow strings are handled as follows:

        If autodecoding is turned on (default), then they are handled as a separate overload.
        If autodecoding is turned off, then this is equivalent to duplicating the array.

    Parameters:
    Range r 	range (or aggregate with opApply function) whose elements are copied into the allocated array
    Returns:
    allocated and initialized array
    Examples:

    auto a = array([1, 2, 3, 4, 5][]);
    writeln(a); // [1, 2, 3, 4, 5]

    Edit
    Run
    Open in IDE
CopyTypeQualifiers!(ElementType!String, dchar)[] array(String)(scope String str)
if (isAutodecodableString!String);
Convert a narrow autodecoding string to an array type that fully supports random access. This is handled as a special case and always returns an array of dchar

    NOTE This function is never used when autodecoding is turned off.
    Parameters:
    String str 	isNarrowString to be converted to an array of dchar
    Returns:
    a dchar[], const(dchar)[], or immutable(dchar)[] depending on the constness of the input.
    Examples:

    import std.range.primitives : isRandomAccessRange;
    import std.traits : isAutodecodableString;

    // note that if autodecoding is turned off, `array` will not transcode these.
    static if (isAutodecodableString!string)
        writeln("Hello D".array); // "Hello D"d
    else
        writeln("Hello D".array); // "Hello D"

    static if (isAutodecodableString!wstring)
        writeln("Hello D"w.array); // "Hello D"d
    else
        writeln("Hello D"w.array); // "Hello D"w

    static assert(isRandomAccessRange!dstring == true);

    Edit
    Run
    Open in IDE
auto assocArray(Range)(Range r)
if (isInputRange!Range);

auto assocArray(Keys, Values)(Keys keys, Values values)
if (isInputRange!Values && isInputRange!Keys);
Returns a newly allocated associative array from a range of key/value tuples or from a range of keys and a range of values.
Parameters:
Range r 	An input range of tuples of keys and values.
Keys keys 	An input range of keys
Values values 	An input range of values
Returns:
A newly allocated associative array out of elements of the input range, which must be a range of tuples (Key, Value) or a range of keys and a range of values. If given two ranges of unequal lengths after the elements of the shorter are exhausted the remaining elements of the longer will not be considered. Returns a null associative array reference when given an empty range.

    Duplicates Associative arrays have unique keys. If r contains duplicate keys, then the result will contain the value of the last pair for that key in r.
    See Also:
    std.typecons.Tuple, std.range.zip
    Examples:

    import std.range : repeat, zip;
    import std.typecons : tuple;
    import std.range.primitives : autodecodeStrings;
    auto a = assocArray(zip([0, 1, 2], ["a", "b", "c"])); // aka zipMap
    static assert(is(typeof(a) == string[int]));
    writeln(a); // [0:"a", 1:"b", 2:"c"]

    auto b = assocArray([ tuple("foo", "bar"), tuple("baz", "quux") ]);
    static assert(is(typeof(b) == string[string]));
    writeln(b); // ["foo":"bar", "baz":"quux"]

    static if (autodecodeStrings)
        alias achar = dchar;
    else
        alias achar = immutable(char);
    auto c = assocArray("ABCD", true.repeat);
    static assert(is(typeof(c) == bool[achar]));
    bool[achar] expected = ['D':true, 'A':true, 'B':true, 'C':true];
    writeln(c); // expected

    Edit
    Run
    Open in IDE
auto byPair(AA)(AA aa)
if (isAssociativeArray!AA);
Construct a range iterating over an associative array by key/value tuples.
Parameters:
AA aa 	The associative array to iterate over.
Returns:
A forward range of Tuple's of key and value pairs from the given associative array. The members of each pair can be accessed by name (.key and .value). or by integer index (0 and 1 respectively).
Examples:

    import std.algorithm.sorting : sort;
    import std.typecons : tuple, Tuple;

    auto aa = ["a": 1, "b": 2, "c": 3];
    Tuple!(string, int)[] pairs;

    // Iteration over key/value pairs.
    foreach (pair; aa.byPair)
    {
        if (pair.key == "b")
            pairs ~= tuple("B", pair.value);
        else
            pairs ~= pair;
    }

    // Iteration order is implementation-dependent, so we should sort it to get
    // a fixed order.
    pairs.sort();
    assert(pairs == [
        tuple("B", 2),
        tuple("a", 1),
        tuple("c", 3)
    ]);

    Edit
    Run
    Open in IDE
nothrow @system auto uninitializedArray(T, I...)(I sizes)
if (isDynamicArray!T && allSatisfy!(isIntegral, I) && hasIndirections!(ElementEncodingType!T));

nothrow @trusted auto uninitializedArray(T, I...)(I sizes)
if (isDynamicArray!T && allSatisfy!(isIntegral, I) && !hasIndirections!(ElementEncodingType!T));
Returns a new array of type T allocated on the garbage collected heap without initializing its elements. This can be a useful optimization if every element will be immediately initialized. T may be a multidimensional array. In this case sizes may be specified for any number of dimensions from 0 to the number in T.
uninitializedArray is nothrow and weakly pure.
uninitializedArray is @system if the uninitialized element type has pointers.
Parameters:
T 	The type of the resulting array elements
I sizes 	The length dimension(s) of the resulting array
Returns:
An array of T with I.length dimensions.
Examples:

    double[] arr = uninitializedArray!(double[])(100);
    writeln(arr.length); // 100

    double[][] matrix = uninitializedArray!(double[][])(42, 31);
    writeln(matrix.length); // 42
    writeln(matrix[0].length); // 31

    char*[] ptrs = uninitializedArray!(char*[])(100);
    writeln(ptrs.length); // 100

    Edit
    Run
    Open in IDE
nothrow @trusted auto minimallyInitializedArray(T, I...)(I sizes)
if (isDynamicArray!T && allSatisfy!(isIntegral, I));
Returns a new array of type T allocated on the garbage collected heap.
Partial initialization is done for types with indirections, for preservation of memory safety. Note that elements will only be initialized to 0, but not necessarily the element type's .init.
minimallyInitializedArray is nothrow and weakly pure.
Parameters:
T 	The type of the array elements
I sizes 	The length dimension(s) of the resulting array
Returns:
An array of T with I.length dimensions.
Examples:

    import std.algorithm.comparison : equal;
    import std.range : repeat;

    auto arr = minimallyInitializedArray!(int[])(42);
    writeln(arr.length); // 42

    // Elements aren't necessarily initialized to 0, so don't do this:
    // assert(arr.equal(0.repeat(42)));
    // If that is needed, initialize the array normally instead:
    auto arr2 = new int[42];
    assert(arr2.equal(0.repeat(42)));

    Edit
    Run
    Open in IDE
@trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
if (is(typeof(a.ptr < b.ptr) == bool));
Returns the overlapping portion, if any, of two arrays. Unlike equal, overlap only compares the pointers and lengths in the ranges, not the values referred by them. If r1 and r2 have an overlapping slice, returns that slice. Otherwise, returns the null slice.
Parameters:
T[] a 	The first array to compare
U[] b 	The second array to compare
Returns:
The overlapping portion of the two arrays.
Examples:

    int[] a = [ 10, 11, 12, 13, 14 ];
    int[] b = a[1 .. 3];
    writeln(overlap(a, b)); // [11, 12]
    b = b.dup;
    // overlap disappears even though the content is the same
    assert(overlap(a, b).empty);

    static test()() @nogc
    {
        auto a = "It's three o'clock"d;
        auto b = a[5 .. 10];
        return b.overlap(a);
    }

    //works at compile-time
    static assert(test == "three"d);

    Edit
    Run
    Open in IDE
void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
Parameters:
T[] array 	The array that stuff will be inserted into.
size_t pos 	The position in array to insert the stuff.
U stuff 	An input range, or any number of implicitly convertible items to insert into array.
Examples:

    int[] a = [ 1, 2, 3, 4 ];
    a.insertInPlace(2, [ 1, 2 ]);
    writeln(a); // [1, 2, 1, 2, 3, 4]
    a.insertInPlace(3, 10u, 11);
    writeln(a); // [1, 2, 1, 10, 11, 2, 3, 4]

    union U
    {
        float a = 3.0;
        int b;
    }

    U u1 = { b : 3 };
    U u2 = { b : 4 };
    U u3 = { b : 5 };
    U[] unionArr = [u2, u3];
    unionArr.insertInPlace(2, [u1]);
    writeln(unionArr); // [u2, u3, u1]
    unionArr.insertInPlace(0, [u3, u2]);
    writeln(unionArr); // [u3, u2, u2, u3, u1]

    static class C
    {
        int a;
        float b;

        this(int a, float b) { this.a = a; this.b = b; }
    }

    C c1 = new C(42, 1.0);
    C c2 = new C(0, 0.0);
    C c3 = new C(int.max, float.init);

    C[] classArr = [c1, c2, c3];
    insertInPlace(classArr, 3, [c2, c3]);
    C[5] classArr1 = classArr;
    writeln(classArr1); // [c1, c2, c3, c2, c3]
    insertInPlace(classArr, 0, c3, c1);
    C[7] classArr2 = classArr;
    writeln(classArr2); // [c3, c1, c1, c2, c3, c2, c3]

    Edit
    Run
    Open in IDE
pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
Returns whether the fronts of lhs and rhs both refer to the same place in memory, making one of the arrays a slice of the other which starts at index 0.
Parameters:
T[] lhs 	the first array to compare
T[] rhs 	the second array to compare
Returns:
true if lhs.ptr == rhs.ptr, false otherwise.
Examples:

    auto a = [1, 2, 3, 4, 5];
    auto b = a[0 .. 2];

    assert(a.sameHead(b));

    Edit
    Run
    Open in IDE
pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
Returns whether the backs of lhs and rhs both refer to the same place in memory, making one of the arrays a slice of the other which end at index $.
Parameters:
T[] lhs 	the first array to compare
T[] rhs 	the second array to compare
Returns:
true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
Examples:

    auto a = [1, 2, 3, 4, 5];
    auto b = a[3..$];

    assert(a.sameTail(b));

    Edit
    Run
    Open in IDE
ElementEncodingType!S[] replicate(S)(S s, size_t n)
if (isDynamicArray!S);

ElementType!S[] replicate(S)(S s, size_t n)
if (isInputRange!S && !isDynamicArray!S);
Parameters:
S s 	an input range or a dynamic array
size_t n 	number of times to repeat s
Returns:
An array that consists of s repeated n times. This function allocates, fills, and returns a new array.
See Also:
For a lazy version, refer to std.range.repeat.
Examples:

    auto a = "abc";
    auto s = replicate(a, 3);

    writeln(s); // "abcabcabc"

    auto b = [1, 2, 3];
    auto c = replicate(b, 3);

    writeln(c); // [1, 2, 3, 1, 2, 3, 1, 2, 3]

    auto d = replicate(b, 0);

    writeln(d); // []

    Edit
    Run
    Open in IDE
pure @safe S[] split(S)(S s)
if (isSomeString!S);

auto split(Range, Separator)(Range range, Separator sep)
if (isForwardRange!Range && (is(typeof(ElementType!Range.init == Separator.init)) || is(typeof(ElementType!Range.init == ElementType!Separator.init)) && isForwardRange!Separator));

auto split(alias isTerminator, Range)(Range range)
if (isForwardRange!Range && is(typeof(unaryFun!isTerminator(range.front))));
Eagerly splits range into an array, using sep as the delimiter.
When no delimiter is provided, strings are split into an array of words, using whitespace as delimiter. Runs of whitespace are merged together (no empty words are produced).
The range must be a forward range. The separator can be a value of the same type as the elements in range or it can be another forward range.
Parameters:
S s 	the string to split by word if no separator is given
Range range 	the range to split
Separator sep 	a value of the same type as the elements of range or another
isTerminator 	a predicate that splits the range when it returns true.
Returns:
An array containing the divided parts of range (or the words of s).
See Also:
std.algorithm.iteration.splitter for a lazy version without allocating memory.
std.regex.splitter for a version that splits using a regular expression defined separator.
Examples:

    import std.uni : isWhite;
    writeln("Learning,D,is,fun".split(",")); // ["Learning", "D", "is", "fun"]
    writeln("Learning D is fun".split!isWhite); // ["Learning", "D", "is", "fun"]
    writeln("Learning D is fun".split(" D ")); // ["Learning", "is fun"]

    Edit
    Run
    Open in IDE
    Examples:

    string str = "Hello World!";
    writeln(str.split); // ["Hello", "World!"]

    string str2 = "Hello\t\tWorld\t!";
    writeln(str2.split); // ["Hello", "World", "!"]

    Edit
    Run
    Open in IDE
    Examples:

    writeln(split("hello world")); // ["hello", "world"]
    writeln(split("192.168.0.1", ".")); // ["192", "168", "0", "1"]

    auto a = split([1, 2, 3, 4, 5, 1, 2, 3, 4, 5], [2, 3]);
    writeln(a); // [[1], [4, 5, 1], [4, 5]]

    Edit
    Run
    Open in IDE
ElementEncodingType!(ElementType!RoR)[] join(RoR, R)(RoR ror, R sep)
if (isInputRange!RoR && isInputRange!(Unqual!(ElementType!RoR)) && isInputRange!R && (is(immutable(ElementType!(ElementType!RoR)) == immutable(ElementType!R)) || isSomeChar!(ElementType!(ElementType!RoR)) && isSomeChar!(ElementType!R)));

ElementEncodingType!(ElementType!RoR)[] join(RoR, E)(RoR ror, scope E sep)
if (isInputRange!RoR && isInputRange!(Unqual!(ElementType!RoR)) && (is(E : ElementType!(ElementType!RoR)) || !autodecodeStrings && isSomeChar!(ElementType!(ElementType!RoR)) && isSomeChar!E));

ElementEncodingType!(ElementType!RoR)[] join(RoR)(RoR ror)
if (isInputRange!RoR && isInputRange!(Unqual!(ElementType!RoR)));
Eagerly concatenates all of the ranges in ror together (with the GC) into one array using sep as the separator if present.
Parameters:
RoR ror 	An input range of input ranges
R sep 	An input range, or a single element, to join the ranges on
Returns:
An array of elements
See Also:
For a lazy version, see std.algorithm.iteration.joiner
Examples:

    writeln(join(["hello", "silly", "world"], " ")); // "hello silly world"
    writeln(join(["hello", "silly", "world"])); // "hellosillyworld"

    writeln(join([[1, 2, 3], [4, 5]], [72, 73])); // [1, 2, 3, 72, 73, 4, 5]
    writeln(join([[1, 2, 3], [4, 5]])); // [1, 2, 3, 4, 5]

    const string[] arr = ["apple", "banana"];
    writeln(arr.join(",")); // "apple,banana"
    writeln(arr.join()); // "applebanana"

    Edit
    Run
    Open in IDE

Jump to: 2 · 3
E[] replace(E, R1, R2)(E[] subject, R1 from, R2 to)
if (isForwardRange!R1 && isForwardRange!R2 && (hasLength!R2 || isSomeString!R2) || is(Unqual!E : Unqual!R1));
Replace occurrences of from with to in subject in a new array.
Parameters:
E[] subject 	the array to scan
R1 from 	the item to replace
R2 to 	the item to replace all instances of from with
Returns:
A new array without changing the contents of subject, or the original array if no match is found.
See Also:
std.algorithm.iteration.substitute for a lazy replace.
Examples:

    writeln("Hello Wörld".replace("o Wö", "o Wo")); // "Hello World"
    writeln("Hello Wörld".replace("l", "h")); // "Hehho Wörhd"

    Edit
    Run
    Open in IDE
E[] replace(E, R1, R2)(E[] subject, R1 from, R2 to, ref size_t changed)
if (isForwardRange!R1 && isForwardRange!R2 && (hasLength!R2 || isSomeString!R2) || is(Unqual!E : Unqual!R1));
Replace occurrences of from with to in subject in a new array. changed counts how many replacements took place.
Parameters:
E[] subject 	the array to scan
R1 from 	the item to replace
R2 to 	the item to replace all instances of from with
size_t changed 	the number of replacements
Returns:
A new array without changing the contents of subject, or the original array if no match is found.
Examples:

    size_t changed = 0;
    writeln("Hello Wörld".replace("o Wö", "o Wo", changed)); // "Hello World"
    writeln(changed); // 1

    changed = 0;
    writeln("Hello Wörld".replace("l", "h", changed)); // "Hehho Wörhd"
    import std.stdio : writeln;
    writeln(changed);
    writeln(changed); // 3

    Edit
    Run
    Open in IDE

Jump to: 2
void replaceInto(E, Sink, R1, R2)(Sink sink, E[] subject, R1 from, R2 to)
if (isOutputRange!(Sink, E) && (isForwardRange!R1 && isForwardRange!R2 && (hasLength!R2 || isSomeString!R2) || is(Unqual!E : Unqual!R1)));
Replace occurrences of from with to in subject and output the result into sink.
Parameters:
Sink sink 	an output range
E[] subject 	the array to scan
R1 from 	the item to replace
R2 to 	the item to replace all instances of from with
See Also:
std.algorithm.iteration.substitute for a lazy replace.
Examples:

    auto arr = [1, 2, 3, 4, 5];
    auto from = [2, 3];
    auto to = [4, 6];
    auto sink = appender!(int[])();

    replaceInto(sink, arr, from, to);

    writeln(sink.data); // [1, 4, 6, 4, 5]

    Edit
    Run
    Open in IDE
void replaceInto(E, Sink, R1, R2)(Sink sink, E[] subject, R1 from, R2 to, ref size_t changed)
if (isOutputRange!(Sink, E) && (isForwardRange!R1 && isForwardRange!R2 && (hasLength!R2 || isSomeString!R2) || is(Unqual!E : Unqual!R1)));
Replace occurrences of from with to in subject and output the result into sink. changed counts how many replacements took place.
Parameters:
Sink sink 	an output range
E[] subject 	the array to scan
R1 from 	the item to replace
R2 to 	the item to replace all instances of from with
size_t changed 	the number of replacements
Examples:

    auto arr = [1, 2, 3, 4, 5];
    auto from = [2, 3];
    auto to = [4, 6];
    auto sink = appender!(int[])();

    size_t changed = 0;
    replaceInto(sink, arr, from, to, changed);

    writeln(sink.data); // [1, 4, 6, 4, 5]
    writeln(changed); // 1

    Edit
    Run
    Open in IDE
T[] replace(T, Range)(T[] subject, size_t from, size_t to, Range stuff)
if (isInputRange!Range && (is(ElementType!Range : T) || isSomeString!(T[]) && is(ElementType!Range : dchar)));
Replaces elements from array with indices ranging from from (inclusive) to to (exclusive) with the range stuff.
Parameters:
T[] subject 	the array to scan
size_t from 	the starting index
size_t to 	the ending index
Range stuff 	the items to replace in-between from and to
Returns:
A new array without changing the contents of subject.
See Also:
std.algorithm.iteration.substitute for a lazy replace.
Examples:

    auto a = [ 1, 2, 3, 4 ];
    auto b = a.replace(1, 3, [ 9, 9, 9 ]);
    writeln(a); // [1, 2, 3, 4]
    writeln(b); // [1, 9, 9, 9, 4]

    Edit
    Run
    Open in IDE
void replaceInPlace(T, Range)(ref T[] array, size_t from, size_t to, Range stuff)
if (is(typeof(replace(array, from, to, stuff))));
Replaces elements from array with indices ranging from from (inclusive) to to (exclusive) with the range stuff. Expands or shrinks the array as needed.
Parameters:
T[] array 	the array to scan
size_t from 	the starting index
size_t to 	the ending index
Range stuff 	the items to replace in-between from and to
Examples:

    int[] a = [1, 4, 5];
    replaceInPlace(a, 1u, 2u, [2, 3, 4]);
    writeln(a); // [1, 2, 3, 4, 5]
    replaceInPlace(a, 1u, 2u, cast(int[])[]);
    writeln(a); // [1, 3, 4, 5]
    replaceInPlace(a, 1u, 3u, a[2 .. 4]);
    writeln(a); // [1, 4, 5, 5]

    Edit
    Run
    Open in IDE
E[] replaceFirst(E, R1, R2)(E[] subject, R1 from, R2 to)
if (isDynamicArray!(E[]) && isForwardRange!R1 && is(typeof(appender!(E[])().put(from[0..1]))) && isForwardRange!R2 && is(typeof(appender!(E[])().put(to[0..1]))));
Replaces the first occurrence of from with to in subject.
Parameters:
E[] subject 	the array to scan
R1 from 	the item to replace
R2 to 	the item to replace from with
Returns:
A new array without changing the contents of subject, or the original array if no match is found.
Examples:

    auto a = [1, 2, 2, 3, 4, 5];
    auto b = a.replaceFirst([2], [1337]);
    writeln(b); // [1, 1337, 2, 3, 4, 5]

    auto s = "This is a foo foo list";
    auto r = s.replaceFirst("foo", "silly");
    writeln(r); // "This is a silly foo list"

    Edit
    Run
    Open in IDE
E[] replaceLast(E, R1, R2)(E[] subject, R1 from, R2 to)
if (isDynamicArray!(E[]) && isForwardRange!R1 && is(typeof(appender!(E[])().put(from[0..1]))) && isForwardRange!R2 && is(typeof(appender!(E[])().put(to[0..1]))));
Replaces the last occurrence of from with to in subject.
Parameters:
E[] subject 	the array to scan
R1 from 	the item to replace
R2 to 	the item to replace from with
Returns:
A new array without changing the contents of subject, or the original array if no match is found.
Examples:

    auto a = [1, 2, 2, 3, 4, 5];
    auto b = a.replaceLast([2], [1337]);
    writeln(b); // [1, 2, 1337, 3, 4, 5]

    auto s = "This is a foo foo list";
    auto r = s.replaceLast("foo", "silly");
    writeln(r); // "This is a foo silly list"

    Edit
    Run
    Open in IDE
inout(T)[] replaceSlice(T)(inout(T)[] s, in T[] slice, in T[] replacement);
Creates a new array such that the items in slice are replaced with the items in replacement. slice and replacement do not need to be the same length. The result will grow or shrink based on the items given.
Parameters:
inout(T)[] s 	the base of the new array
T[] slice 	the slice of s to be replaced
T[] replacement 	the items to replace slice with
Returns:
A new array that is s with slice replaced by replacement[].
See Also:
std.algorithm.iteration.substitute for a lazy replace.
Examples:

    auto a = [1, 2, 3, 4, 5];
    auto b = replaceSlice(a, a[1 .. 4], [0, 0, 0]);

    writeln(b); // [1, 0, 0, 0, 5]

    Edit
    Run
    Open in IDE

Jump to: capacity · clear · data · opOpAssign · opSlice · put · reserve · shrinkTo · this · toString
struct Appender(A) if (isDynamicArray!A);
Implements an output range that appends data to an array. This is recommended over array ~= data when appending many elements because it is more efficient. Appender maintains its own array metadata locally, so it can avoid the performance hit of looking up slice capacity for each append.
Parameters:
A 	the array type to simulate.
See Also:
appender
Examples:

    auto app = appender!string();
    string b = "abcdefg";
    foreach (char c; b)
        app.put(c);
    writeln(app[]); // "abcdefg"

    int[] a = [ 1, 2 ];
    auto app2 = appender(a);
    app2.put(3);
    app2.put([ 4, 5, 6 ]);
    writeln(app2[]); // [1, 2, 3, 4, 5, 6]

    Edit
    Run
    Open in IDE

    @trusted this(A arr);
        Constructs an Appender with a given array. Note that this does not copy the data. If the array has a larger capacity as determined by arr.capacity, it will be used by the appender. After initializing an appender on an array, appending to the original array will reallocate.
    void reserve(size_t newCapacity);
        Reserve at least newCapacity elements for appending. Note that more elements may be reserved than requested. If newCapacity <= capacity, then nothing is done.
        Parameters:
        size_t newCapacity 	the capacity the Appender should have
    const @property size_t capacity();
        Returns:
        the capacity of the array (the maximum number of elements the managed array can accommodate before triggering a reallocation). If any appending will reallocate, 0 will be returned.
    inout @property @trusted inout(T)[] data();
        Use opSlice() from now on.
        Returns:
        The managed array.
    inout @property @trusted inout(T)[] opSlice();
        Returns:
        The managed array.

    Jump to: 2
    void put(U)(U item)
    if (canPutItem!U);
        Appends item to the managed array. Performs encoding for char types if A is a differently typed char array.
        Parameters:
        U item 	the single item to append
    void put(Range)(Range items)
    if (canPutRange!Range);
        Appends an entire range to the managed array. Performs encoding for char elements if A is a differently typed char array.
        Parameters:
        Range items 	the range of items to append
    template opOpAssign(string op : "~")
        Appends to the managed array.
        See Also:
        Appender.put
    pure nothrow @trusted void clear();
        Clears the managed array. This allows the elements of the array to be reused for appending.

        Note clear is disabled for immutable or const element types, due to the possibility that Appender might overwrite immutable data.
    pure @trusted void shrinkTo(size_t newlength);
        Shrinks the managed array to the given length.
        Throws:
        Exception if newlength is greater than the current array length.

        Note shrinkTo is disabled for immutable or const element types.
    const string toString()();

    const void toString(Writer)(ref Writer w, ref scope const FormatSpec!char fmt)
    if (isOutputRange!(Writer, char));
        Gives a string in the form of Appender!(A)(data).
        Parameters:
        Writer w 	A char accepting output range.
        FormatSpec!char fmt 	A std.format.FormatSpec which controls how the array is formatted.
        Returns:
        A string if writer is not set; void otherwise.

Jump to: capacity · opDispatch · opOpAssign · opSlice · this
struct RefAppender(A) if (isDynamicArray!A);
A version of Appender that can update an array in-place. It forwards all calls to an underlying appender implementation. Any calls made to the appender also update the pointer to the original array passed in.

    Tip Use the arrayPtr overload of appender for construction with type-inference.
    Parameters:
    A 	The array type to simulate
    Examples:

    int[] a = [1, 2];
    auto app2 = appender(&a);
    writeln(app2[]); // [1, 2]
    writeln(a); // [1, 2]
    app2 ~= 3;
    app2 ~= [4, 5, 6];
    writeln(app2[]); // [1, 2, 3, 4, 5, 6]
    writeln(a); // [1, 2, 3, 4, 5, 6]

    app2.reserve(5);
    assert(app2.capacity >= 5);

    Edit
    Run
    Open in IDE

    this(A* arr);
        Constructs a RefAppender with a given array reference. This does not copy the data. If the array has a larger capacity as determined by arr.capacity, it will be used by the appender.

        Note Do not use built-in appending (i.e. ~=) on the original array until you are done with the appender, because subsequent calls to the appender will reallocate the array data without those appends.
        Parameters:
        A* arr 	Pointer to an array. Must not be null.
    void opDispatch(string fn, Args...)(Args args)
    if (__traits(compiles, (Appender!A a) => mixin("a." ~ fn ~ "(args)")));
        Wraps remaining Appender methods such as put.
        Parameters:
        fn 	Method name to call.
        Args args 	Arguments to pass to the method.
    void opOpAssign(string op : "~", U)(U rhs)
    if (__traits(compiles, (Appender!A a) { a.put(rhs); } ));
        Appends rhs to the managed array.
        Parameters:
        U rhs 	Element or range.
    const @property size_t capacity();
        Returns the capacity of the array (the maximum number of elements the managed array can accommodate before triggering a reallocation). If any appending will reallocate, capacity returns 0.
    inout @property inout(ElementEncodingType!A)[] opSlice();
        Returns:
        the managed array.

Jump to: 2
Appender!A appender(A)()
if (isDynamicArray!A);

Appender!(E[]) appender(A : E[], E)(auto ref A array);
Convenience function that returns an Appender instance, optionally initialized with array.
Examples:

    auto w = appender!string;
    // pre-allocate space for at least 10 elements (this avoids costly reallocations)
    w.reserve(10);
    assert(w.capacity >= 10);

    w.put('a'); // single elements
    w.put("bc"); // multiple elements

    // use the append syntax
    w ~= 'd';
    w ~= "ef";

    writeln(w[]); // "abcdef"

    Edit
    Run
    Open in IDE
RefAppender!(E[]) appender(P : E[]*, E)(P arrayPtr);
Convenience function that returns a RefAppender instance initialized with arrayPtr. Don't use null for the array pointer, use the other version of appender instead.
Examples:

    int[] a = [1, 2];
    auto app2 = appender(&a);
    writeln(app2[]); // [1, 2]
    writeln(a); // [1, 2]
    app2 ~= 3;
    app2 ~= [4, 5, 6];
    writeln(app2[]); // [1, 2, 3, 4, 5, 6]
    writeln(a); // [1, 2, 3, 4, 5, 6]

    app2.reserve(5);
    assert(app2.capacity >= 5);

    Edit
    Run
    Open in IDE

Jump to: 2
T[n] staticArray(T, size_t n)(auto ref T[n] a);

U[n] staticArray(U, T, size_t n)(auto ref T[n] a)
if (!is(T == U) && is(T : U));
Constructs a static array from a dynamic array whose length is known at compile-time. The element type can be inferred or specified explicitly:

        [1, 2].staticArray returns int[2]
        [1, 2].staticArray!float returns float[2]

    Note staticArray returns by value, so expressions involving large arrays may be inefficient.
    Parameters:
    T[n] a 	The input array.
    Returns:
    A static array constructed from a.
    Examples:
    static array from array literal

    auto a = [0, 1].staticArray;
    static assert(is(typeof(a) == int[2]));
    writeln(a); // [0, 1]

    Edit
    Run
    Open in IDE
    Examples:
    static array from array with implicit casting of elements

    auto b = [0, 1].staticArray!long;
    static assert(is(typeof(b) == long[2]));
    writeln(b); // [0, 1]

    Edit
    Run
    Open in IDE
auto staticArray(size_t n, T)(scope T a)
if (isInputRange!T);

auto staticArray(size_t n, T)(scope T a, out size_t rangeLength)
if (isInputRange!T);

auto staticArray(Un : U[n], U, size_t n, T)(scope T a)
if (isInputRange!T && is(ElementType!T : U));

auto staticArray(Un : U[n], U, size_t n, T)(scope T a, out size_t rangeLength)
if (isInputRange!T && is(ElementType!T : U));

auto staticArray(alias a)()
if (isInputRange!(typeof(a)));

auto staticArray(U, alias a)()
if (isInputRange!(typeof(a)));
Constructs a static array from a range. When a.length is not known at compile time, the number of elements must be given as a template argument (e.g. myrange.staticArray!2). Size and type can be combined, if the source range elements are implicitly convertible to the requested element type (eg: 2.iota.staticArray!(long[2])).
When the range a is known at compile time, it can be given as a template argument to avoid having to specify the number of elements (e.g.: staticArray!(2.iota) or staticArray!(double, 2.iota)).
Parameters:
T a 	The input range. If there are less elements than the specified length of the static array, the rest of it is default-initialized. If there are more than specified, the first elements up to the specified length are used.
size_t rangeLength 	Output for the number of elements used from a. Optional.
Examples:
static array from range + size

    import std.range : iota;

    auto input = 3.iota;
    auto a = input.staticArray!2;
    static assert(is(typeof(a) == int[2]));
    writeln(a); // [0, 1]
    auto b = input.staticArray!(long[4]);
    static assert(is(typeof(b) == long[4]));
    writeln(b); // [0, 1, 2, 0]

    Edit
    Run
    Open in IDE
    Examples:
    static array from CT range

    import std.range : iota;

    enum a = staticArray!(2.iota);
    static assert(is(typeof(a) == int[2]));
    writeln(a); // [0, 1]

    enum b = staticArray!(long, 2.iota);
    static assert(is(typeof(b) == long[2]));
    writeln(b); // [0, 1]
