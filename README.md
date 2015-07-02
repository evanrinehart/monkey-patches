To define simple functions like f : A -> B, that take an A and return a B
(always or perhaps nil or perhaps throwing an exception) in Ruby you pretty
much have to resort to adding a method to the A class. This lets you use f
in a chain that produces A as an intermediate step. This also satisfies our
need for function composition in some common cases.

I have seen a few suggestions to make a subclass A' of A instead. But then you
still need a trivial conversion step. To use that conversion in a chain that
produces an A, you need a trivial conversion method on A, leading us back to
the original problem.

While adding the new method directly to A is pretty weird, and introduces
namespace collision issues, it's the best we have.

I included some "monkey patches" to provide some obvious operations that are
not available by default or have objectionable behavior by default.

Run the tests with `ruby -I. tests.rb`
