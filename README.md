# mimic

Copy a class's interface and apply it to a new object that acts as a mimic

## Example

``` ruby
class SomeClass
  def some_method
    puts 'In some_method'
  end
end

mimic = Mimic.(SomeClass)

mimic.some_method
# => (does nothing)

mimic.some_other_method
# NameError (undefined local variable or method `some_other_method')

mimic.is_a?(SomeClass)
# => true

```

## Replaced Methods and the Void Return Type

Methods on a mimicked object are replaced with an implementation that returns an instance of `Mimic::Void`.

The purpose of this is to ensure that code that attempts to invoke any subsequent method on a value returned from a replaced method will result in an error.

``` ruby
mimic = Mimic.(SomeClass)

result = mimic.some_method

result.any_method
# => Mimic::Void::Error (Cannot invoke `any_method' on a void)
```

NOTE: Method chaining is not possible with a mimicked object. This is done with respect to the [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter). For a library that offers more advanced features, such as _Black Hole_ styled null objects, consider [Naught](https://github.com/avdi/naught) (amongst others).

## Preserved Methods

Mimicked objects' instance methods are replaced with voided methods _except_ for instance methods defined on Ruby's `Object` class.

A list of methods that are preserved can be retrieved from the `Mimic::ReplaceMethods` module.

``` ruby
puts Mimic.preserved_methods
```

## License

The `mimic` library is released under the [MIT License](https://github.com/eventide-project/mimic/blob/master/MIT-License.txt).
