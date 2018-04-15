# Explaining Code in Words

### a = 'hello'
On `line 1` of this code we are initializing the local variable `a` and
assigning a string object with value `hello` to it.

On `line 3` we are reassigning the local variable `a` to a different string
object with value `hello` .


### b = a
On `line 2` we are initializing the local variable `b` and assigning to
it a string object that the local variable `a` is referencing. Currently,
both of these local variables are pointing to the same object.

### def example(str)
On `line 1` we are defining the method `example` which takes 1 parameter. On
`line 10` we are calling the method `example` and passing in the string `hello`
as an argument to it.

### loop do
On `line 3` we are calling the method `loop` and passing in the `do..end` block
as an argument.
The output of de method `loop` will be ......
The `loop` method returns `nil` because the last evaluated statement in the loop
is `break` (implicit break which is `break nil`) and thus returns `nil`

### puts a
On `line 6` we are calling the method `puts` and passing it local variable `a`
as an argument. `puts` will print the value of string object that `a` is
referencing, which is `5`. The return value of the `puts` will be `nil`

On `line 7` we are calling the method `puts` and passing it local variable `b`
as an argument. `puts` will try to print the value of string object that `b` is
referencing, but since `b` was initialized in the inner scope of the `loop`
method, `puts` can not access `b` and will throw an error.

### i -= 1
On `line 5` the local variable `i` is reassigned to the return value of a
method call `Integer#-` on a local variable `i` with integer `1` passed to it as
an argument.

### break if i == 0
On `line 6` we are breaking out of the loop by using the keyword `break` if the
value of the object that local variable `i` is referencing is equal to 0.

### 2.times do |a|
On `line 3` we call the method `times` on the integer `2` and pass it
a end..do block as an argument with a parameter `a`.
(variable shadowing: this `a` has nothing to do with the outer scope `a`).

(??? this code? the block? the times?)
This code outputs the output of line 5 (`5`) two times
This code returns value of the object it was called on, `2` in this case.

### each
[1, 2, 3, 4].each { |num| puts num }
The `Array#each` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

`Array#each` doesn't do anything with the return value of the block, it
returns the original array - in this case `[1, 2, 3, 4]`

### map
[1, 2, 3, 4].map { |num| puts num }
The `Array#map` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

`Array#map` returns a new array based on the block’s return value. Each
element is transformed based on the return value.

Since the return value of the block is `nil`, `Array#map` will return an
array with every orignal element transformed into `nil`
=> `[nil, nil, nil, nil]`

### select
[1, 2, 3, 4].select { |num| puts num }

The `Array#select` method is being called on an array.
Each element of the array is passed to the block in turn and assigned
to the local variable `num`.

The `puts `method then outputs a string representation of `num`.
`puts` returns `nil`. Since this is the last evaluated
statement within the block, the return value of the block is therefore
`nil`.

`Array#select` returns a new array based on the block’s return value.
If the return value evaluates to true (or: is truthy), then the element
is selected.

Since the return value of the block is `nil` (which evaluates to false)
for each passed in element, `Array#select` will return an empty array.