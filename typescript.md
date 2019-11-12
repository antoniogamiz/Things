# Notes about Typescript

- Relative paths imports using an argument in `compilerOptions`: https://dev.to/cooperdev/restructure-with-ease-thanks-to-typescript-path-mappings-4b0e

- Prototype chain in deep: https://dev.to/sag1v/javascript-the-prototype-chain-in-depth-2p58
- https://zohaib.me/creating-object-based-on-interface-type-in-typescript/

This way of creating objects assure you type-safety.

~~~ts
interface Foo {
    bar: string;
    qux: number;
    baz: boolean;
}

const waldo: Foo = {
    bar: "Hello",
    qux: 7
}
~~~

## Tools

- Create dependencie graphs: [link](https://github.com/pahen/madge)