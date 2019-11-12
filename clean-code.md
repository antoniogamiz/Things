# Tips clean code

Instead of nested `IF` statements we should write:

~~~js
if (!condition) {
    return;
    // error handling here
}

if (!condition2) {
    return;
    // error handling here
}

// normal logic :D
~~~