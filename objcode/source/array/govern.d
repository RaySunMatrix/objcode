module array.govern;

import std.algorithm.comparison : equal;
import std.range : repeat;


class ArrayGovern {
      /**
      Returns a new array of type T allocated on the garbage collected heap.
      Partial initialization is done for types with indirections, for preservation 
      of memory safety. Note that elements will only be initialized to 0, but not 
      necessarily the element type's .init.
      minimallyInitializedArray is nothrow and weakly pure.
      Parameters:
      T 	The type of the array elements
      I sizes 	The length dimension(s) of the resulting array
      Returns:
      An array of T with I.length dimensions. 
      Examples: **/

      public void bigBehindScenesEconomy(const char* Array, char Click)(ref Economy) {

        auto arr = minimallyInitializedArray!(int[])(42);
        writeln(arr.length); // 42

        // Elements aren't necessarily initialized to 0, so don't do this:
        // assert(arr.equal(0.repeat(42)));
        // If that is needed, initialize the array normally instead:
        auto arr2 = new int[42];
        assert(arr2.equal(0.repeat(42)));

        @trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
            if (is(typeof(a.ptr < b.ptr) == bool));
      }

      /**
      Returns the overlapping portion, if any, of two arrays. Unlike equal, 
      overlap only compares the pointers and lengths in the ranges, not the 
      values referred by them. If r1 and r2 have an overlapping slice, returns 
      that slice. Otherwise, returns the null slice.
      Parameters:
      T[] a 	The first array to compare
      U[] b 	The second array to compare
      Returns:
      The overlapping portion of the two arrays.
      Examples:**/
      
      public void bigBehindScenesSocial(const char* Array, char Click)(ref Social) {

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

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
            if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
           if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
      } 

      /**
      Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
      Parameters:
      T[] array 	The array that stuff will be inserted into.
      size_t pos 	The position in array to insert the stuff.
       U stuff 	An input range, or any number of implicitly convertible items to insert into array.
      Examples: **/
      
      public void bigBehindScenesPolicy(const char* Array, char Click)(ref Policy) {

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

    pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
      }

    /**
    Returns whether the fronts of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which starts at index 0.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/

    public void bigBehindScenesLines(const char* Array, char Click)(ref Lines) {
         auto a = [1, 2, 3, 4, 5];
         auto b = a[0 .. 2];

         assert(a.sameHead(b));

         pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
    }


    /**
    Returns whether the backs of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which end at index $.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/ 
    public void bigBehindScenesDialog(const char Array, char Click)(ref Dialog) {
        auto a = [1, 2, 3, 4, 5];
        auto b = a[3..$];

        assert(a.sameTail(b));

        ElementEncodingType!S[] replicate(S)(S s, size_t n)
           if (isDynamicArray!S);

        ElementType!S[] replicate(S)(S s, size_t n)
           if (isInputRange!S && !isDynamicArray!S);
    }
         
}

class ArrayGovernSecurity {
      /**
      Returns a new array of type T allocated on the garbage collected heap.
      Partial initialization is done for types with indirections, for preservation 
      of memory safety. Note that elements will only be initialized to 0, but not 
      necessarily the element type's .init.
      minimallyInitializedArray is nothrow and weakly pure.
      Parameters:
      T 	The type of the array elements
      I sizes 	The length dimension(s) of the resulting array
      Returns:
      An array of T with I.length dimensions. 
      Examples: **/

      public void bigBehindScenesEconomy(const char* Array, char Click)(ref Economy) {

        auto arr = minimallyInitializedArray!(int[])(42);
        writeln(arr.length); // 42

        // Elements aren't necessarily initialized to 0, so don't do this:
        // assert(arr.equal(0.repeat(42)));
        // If that is needed, initialize the array normally instead:
        auto arr2 = new int[42];
        assert(arr2.equal(0.repeat(42)));

        @trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
            if (is(typeof(a.ptr < b.ptr) == bool));
      }

      /**
      Returns the overlapping portion, if any, of two arrays. Unlike equal, 
      overlap only compares the pointers and lengths in the ranges, not the 
      values referred by them. If r1 and r2 have an overlapping slice, returns 
      that slice. Otherwise, returns the null slice.
      Parameters:
      T[] a 	The first array to compare
      U[] b 	The second array to compare
      Returns:
      The overlapping portion of the two arrays.
      Examples:**/
      
      public void bigBehindScenesSocial(const char* Array, char Click)(ref Social) {

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

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
            if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
           if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
      } 

      /**
      Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
      Parameters:
      T[] array 	The array that stuff will be inserted into.
      size_t pos 	The position in array to insert the stuff.
       U stuff 	An input range, or any number of implicitly convertible items to insert into array.
      Examples: **/
      
      public void bigBehindScenesPolicy(const char* Array, char Click)(ref Policy) {

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

    pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
      }

    /**
    Returns whether the fronts of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which starts at index 0.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/

    public void bigBehindScenesLines(const char* Array, char Click)(ref Lines) {
         auto a = [1, 2, 3, 4, 5];
         auto b = a[0 .. 2];

         assert(a.sameHead(b));

         pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
    }


    /**
    Returns whether the backs of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which end at index $.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/ 
    public void bigBehindScenesDialog(const char Array, char Click)(ref Dialog) {
        auto a = [1, 2, 3, 4, 5];
        auto b = a[3..$];

        assert(a.sameTail(b));

        ElementEncodingType!S[] replicate(S)(S s, size_t n)
           if (isDynamicArray!S);

        ElementType!S[] replicate(S)(S s, size_t n)
           if (isInputRange!S && !isDynamicArray!S);
    }
         
}

class ArrayGovernHtmlSafes {
      /**
      Returns a new array of type T allocated on the garbage collected heap.
      Partial initialization is done for types with indirections, for preservation 
      of memory safety. Note that elements will only be initialized to 0, but not 
      necessarily the element type's .init.
      minimallyInitializedArray is nothrow and weakly pure.
      Parameters:
      T 	The type of the array elements
      I sizes 	The length dimension(s) of the resulting array
      Returns:
      An array of T with I.length dimensions. 
      Examples: **/

      public void bigBehindScenesEconomy(const char* Array, char Click)(ref Economy) {

        auto arr = minimallyInitializedArray!(int[])(42);
        writeln(arr.length); // 42

        // Elements aren't necessarily initialized to 0, so don't do this:
        // assert(arr.equal(0.repeat(42)));
        // If that is needed, initialize the array normally instead:
        auto arr2 = new int[42];
        assert(arr2.equal(0.repeat(42)));

        @trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
            if (is(typeof(a.ptr < b.ptr) == bool));
      }

      /**
      Returns the overlapping portion, if any, of two arrays. Unlike equal, 
      overlap only compares the pointers and lengths in the ranges, not the 
      values referred by them. If r1 and r2 have an overlapping slice, returns 
      that slice. Otherwise, returns the null slice.
      Parameters:
      T[] a 	The first array to compare
      U[] b 	The second array to compare
      Returns:
      The overlapping portion of the two arrays.
      Examples:**/
      
      public void bigBehindScenesSocial(const char* Array, char Click)(ref Social) {

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

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
            if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
           if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
      } 

      /**
      Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
      Parameters:
      T[] array 	The array that stuff will be inserted into.
      size_t pos 	The position in array to insert the stuff.
       U stuff 	An input range, or any number of implicitly convertible items to insert into array.
      Examples: **/
      
      public void bigBehindScenesPolicy(const char* Array, char Click)(ref Policy) {

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

    pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
      }

    /**
    Returns whether the fronts of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which starts at index 0.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/

    public void bigBehindScenesLines(const char* Array, char Click)(ref Lines) {
         auto a = [1, 2, 3, 4, 5];
         auto b = a[0 .. 2];

         assert(a.sameHead(b));

         pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
    }


    /**
    Returns whether the backs of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which end at index $.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/ 
    public void bigBehindScenesDialog(const char Array, char Click)(ref Dialog) {
        auto a = [1, 2, 3, 4, 5];
        auto b = a[3..$];

        assert(a.sameTail(b));

        ElementEncodingType!S[] replicate(S)(S s, size_t n)
           if (isDynamicArray!S);

        ElementType!S[] replicate(S)(S s, size_t n)
           if (isInputRange!S && !isDynamicArray!S);
    }
         
}

class ArrayGovernMaxSecurity {
      /**
      Returns a new array of type T allocated on the garbage collected heap.
      Partial initialization is done for types with indirections, for preservation 
      of memory safety. Note that elements will only be initialized to 0, but not 
      necessarily the element type's .init.
      minimallyInitializedArray is nothrow and weakly pure.
      Parameters:
      T 	The type of the array elements
      I sizes 	The length dimension(s) of the resulting array
      Returns:
      An array of T with I.length dimensions. 
      Examples: **/

      public void bigBehindScenesEconomy(const char* Array, char Click)(ref Economy) {

        auto arr = minimallyInitializedArray!(int[])(42);
        writeln(arr.length); // 42

        // Elements aren't necessarily initialized to 0, so don't do this:
        // assert(arr.equal(0.repeat(42)));
        // If that is needed, initialize the array normally instead:
        auto arr2 = new int[42];
        assert(arr2.equal(0.repeat(42)));

        @trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
            if (is(typeof(a.ptr < b.ptr) == bool));
      }

      /**
      Returns the overlapping portion, if any, of two arrays. Unlike equal, 
      overlap only compares the pointers and lengths in the ranges, not the 
      values referred by them. If r1 and r2 have an overlapping slice, returns 
      that slice. Otherwise, returns the null slice.
      Parameters:
      T[] a 	The first array to compare
      U[] b 	The second array to compare
      Returns:
      The overlapping portion of the two arrays.
      Examples:**/
      
      public void bigBehindScenesSocial(const char* Array, char Click)(ref Social) {

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

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
            if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
           if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
      } 

      /**
      Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
      Parameters:
      T[] array 	The array that stuff will be inserted into.
      size_t pos 	The position in array to insert the stuff.
       U stuff 	An input range, or any number of implicitly convertible items to insert into array.
      Examples: **/
      
      public void bigBehindScenesPolicy(const char* Array, char Click)(ref Policy) {

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

    pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
      }

    /**
    Returns whether the fronts of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which starts at index 0.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/

    public void bigBehindScenesLines(const char* Array, char Click)(ref Lines) {
         auto a = [1, 2, 3, 4, 5];
         auto b = a[0 .. 2];

         assert(a.sameHead(b));

         pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
    }


    /**
    Returns whether the backs of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which end at index $.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/ 
    public void bigBehindScenesDialog(const char Array, char Click)(ref Dialog) {
        auto a = [1, 2, 3, 4, 5];
        auto b = a[3..$];

        assert(a.sameTail(b));

        ElementEncodingType!S[] replicate(S)(S s, size_t n)
           if (isDynamicArray!S);

        ElementType!S[] replicate(S)(S s, size_t n)
           if (isInputRange!S && !isDynamicArray!S);
    }
         
}

class ArrayGovernMinisters {
      /**
      Returns a new array of type T allocated on the garbage collected heap.
      Partial initialization is done for types with indirections, for preservation 
      of memory safety. Note that elements will only be initialized to 0, but not 
      necessarily the element type's .init.
      minimallyInitializedArray is nothrow and weakly pure.
      Parameters:
      T 	The type of the array elements
      I sizes 	The length dimension(s) of the resulting array
      Returns:
      An array of T with I.length dimensions. 
      Examples: **/

      public void bigBehindScenesEconomy(const char* Array, char Click)(ref Economy) {

        auto arr = minimallyInitializedArray!(int[])(42);
        writeln(arr.length); // 42

        // Elements aren't necessarily initialized to 0, so don't do this:
        // assert(arr.equal(0.repeat(42)));
        // If that is needed, initialize the array normally instead:
        auto arr2 = new int[42];
        assert(arr2.equal(0.repeat(42)));

        @trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
            if (is(typeof(a.ptr < b.ptr) == bool));
      }

      /**
      Returns the overlapping portion, if any, of two arrays. Unlike equal, 
      overlap only compares the pointers and lengths in the ranges, not the 
      values referred by them. If r1 and r2 have an overlapping slice, returns 
      that slice. Otherwise, returns the null slice.
      Parameters:
      T[] a 	The first array to compare
      U[] b 	The second array to compare
      Returns:
      The overlapping portion of the two arrays.
      Examples:**/
      
      public void bigBehindScenesSocial(const char* Array, char Click)(ref Social) {

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

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
            if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
           if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
      } 

      /**
      Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
      Parameters:
      T[] array 	The array that stuff will be inserted into.
      size_t pos 	The position in array to insert the stuff.
       U stuff 	An input range, or any number of implicitly convertible items to insert into array.
      Examples: **/
      
      public void bigBehindScenesPolicy(const char* Array, char Click)(ref Policy) {

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

    pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
      }

    /**
    Returns whether the fronts of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which starts at index 0.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/

    public void bigBehindScenesLines(const char* Array, char Click)(ref Lines) {
         auto a = [1, 2, 3, 4, 5];
         auto b = a[0 .. 2];

         assert(a.sameHead(b));

         pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
    }


    /**
    Returns whether the backs of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which end at index $.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/ 
    public void bigBehindScenesDialog(const char Array, char Click)(ref Dialog) {
        auto a = [1, 2, 3, 4, 5];
        auto b = a[3..$];

        assert(a.sameTail(b));

        ElementEncodingType!S[] replicate(S)(S s, size_t n)
           if (isDynamicArray!S);

        ElementType!S[] replicate(S)(S s, size_t n)
           if (isInputRange!S && !isDynamicArray!S);
    }
         
}

class ArrayGovernWorkplaces {
      /**
      Returns a new array of type T allocated on the garbage collected heap.
      Partial initialization is done for types with indirections, for preservation 
      of memory safety. Note that elements will only be initialized to 0, but not 
      necessarily the element type's .init.
      minimallyInitializedArray is nothrow and weakly pure.
      Parameters:
      T 	The type of the array elements
      I sizes 	The length dimension(s) of the resulting array
      Returns:
      An array of T with I.length dimensions. 
      Examples: **/

      public void bigBehindScenesEconomy(const char* Array, char Click)(ref Economy) {

        auto arr = minimallyInitializedArray!(int[])(42);
        writeln(arr.length); // 42

        // Elements aren't necessarily initialized to 0, so don't do this:
        // assert(arr.equal(0.repeat(42)));
        // If that is needed, initialize the array normally instead:
        auto arr2 = new int[42];
        assert(arr2.equal(0.repeat(42)));

        @trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
            if (is(typeof(a.ptr < b.ptr) == bool));
      }

      /**
      Returns the overlapping portion, if any, of two arrays. Unlike equal, 
      overlap only compares the pointers and lengths in the ranges, not the 
      values referred by them. If r1 and r2 have an overlapping slice, returns 
      that slice. Otherwise, returns the null slice.
      Parameters:
      T[] a 	The first array to compare
      U[] b 	The second array to compare
      Returns:
      The overlapping portion of the two arrays.
      Examples:**/
      
      public void bigBehindScenesSocial(const char* Array, char Click)(ref Social) {

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

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
            if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
           if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
      } 

      /**
      Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
      Parameters:
      T[] array 	The array that stuff will be inserted into.
      size_t pos 	The position in array to insert the stuff.
       U stuff 	An input range, or any number of implicitly convertible items to insert into array.
      Examples: **/
      
      public void bigBehindScenesPolicy(const char* Array, char Click)(ref Policy) {

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

    pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
      }

    /**
    Returns whether the fronts of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which starts at index 0.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/

    public void bigBehindScenesLines(const char* Array, char Click)(ref Lines) {
         auto a = [1, 2, 3, 4, 5];
         auto b = a[0 .. 2];

         assert(a.sameHead(b));

         pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
    }


    /**
    Returns whether the backs of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which end at index $.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/ 
    public void bigBehindScenesDialog(const char Array, char Click)(ref Dialog) {
        auto a = [1, 2, 3, 4, 5];
        auto b = a[3..$];

        assert(a.sameTail(b));

        ElementEncodingType!S[] replicate(S)(S s, size_t n)
           if (isDynamicArray!S);

        ElementType!S[] replicate(S)(S s, size_t n)
           if (isInputRange!S && !isDynamicArray!S);
    }
         
}

class ArrayGovernHomeOffice {
      /**
      Returns a new array of type T allocated on the garbage collected heap.
      Partial initialization is done for types with indirections, for preservation 
      of memory safety. Note that elements will only be initialized to 0, but not 
      necessarily the element type's .init.
      minimallyInitializedArray is nothrow and weakly pure.
      Parameters:
      T 	The type of the array elements
      I sizes 	The length dimension(s) of the resulting array
      Returns:
      An array of T with I.length dimensions. 
      Examples: **/

      public void bigBehindScenesEconomy(const char* Array, char Click)(ref Economy) {

        auto arr = minimallyInitializedArray!(int[])(42);
        writeln(arr.length); // 42

        // Elements aren't necessarily initialized to 0, so don't do this:
        // assert(arr.equal(0.repeat(42)));
        // If that is needed, initialize the array normally instead:
        auto arr2 = new int[42];
        assert(arr2.equal(0.repeat(42)));

        @trusted CommonType!(T[], U[]) overlap(T, U)(T[] a, U[] b)
            if (is(typeof(a.ptr < b.ptr) == bool));
      }

      /**
      Returns the overlapping portion, if any, of two arrays. Unlike equal, 
      overlap only compares the pointers and lengths in the ranges, not the 
      values referred by them. If r1 and r2 have an overlapping slice, returns 
      that slice. Otherwise, returns the null slice.
      Parameters:
      T[] a 	The first array to compare
      U[] b 	The second array to compare
      Returns:
      The overlapping portion of the two arrays.
      Examples:**/
      
      public void bigBehindScenesSocial(const char* Array, char Click)(ref Social) {

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

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
            if (!isSomeString!(T[]) && allSatisfy!(isInputRangeOrConvertible!T, U) && (U.length > 0));

       void insertInPlace(T, U...)(ref T[] array, size_t pos, U stuff)
           if (isSomeString!(T[]) && allSatisfy!(isCharOrStringOrDcharRange, U));
      } 

      /**
      Inserts stuff (which must be an input range or any number of implicitly convertible items) in array at position pos.
      Parameters:
      T[] array 	The array that stuff will be inserted into.
      size_t pos 	The position in array to insert the stuff.
       U stuff 	An input range, or any number of implicitly convertible items to insert into array.
      Examples: **/
      
      public void bigBehindScenesPolicy(const char* Array, char Click)(ref Policy) {

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

    pure nothrow @nogc @safe bool sameHead(T)(in T[] lhs, in T[] rhs);
      }

    /**
    Returns whether the fronts of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which starts at index 0.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/

    public void bigBehindScenesLines(const char* Array, char Click)(ref Lines) {
         auto a = [1, 2, 3, 4, 5];
         auto b = a[0 .. 2];

         assert(a.sameHead(b));

         pure nothrow @nogc @trusted bool sameTail(T)(in T[] lhs, in T[] rhs);
    }


    /**
    Returns whether the backs of lhs and rhs both refer to the same place in memory, 
    making one of the arrays a slice of the other which end at index $.
    Parameters:
    T[] lhs 	the first array to compare
    T[] rhs 	the second array to compare
    Returns:
    true if both arrays are the same length and lhs.ptr == rhs.ptr, false otherwise.
    Examples:**/ 
    public void bigBehindScenesDialog(const char Array, char Click)(ref Dialog) {
        auto a = [1, 2, 3, 4, 5];
        auto b = a[3..$];

        assert(a.sameTail(b));

        ElementEncodingType!S[] replicate(S)(S s, size_t n)
           if (isDynamicArray!S);

        ElementType!S[] replicate(S)(S s, size_t n)
           if (isInputRange!S && !isDynamicArray!S);
    }
         
}       
