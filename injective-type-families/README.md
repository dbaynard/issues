# injective-type-families

See `Main.hs`.

Surely injective type families compose?

In the error, `Injective1` should be allowed on the RHS as it is injective, in addition to Injective2 being injective.

```
[1 of 1] Compiling Main             ( /$HOME/Projects/issues/injective-type-families/src/Main.hs, interpreted )

/$HOME/Projects/issues/injective-type-families/src/Main.hs:24:3: error:
    • Type family equation violates injectivity annotation.
      RHS of injective type family equation cannot be a type family:
        Injective2 Int = Injective1 Bool
          -- Defined at /$HOME/Projects/issues/injective-type-families/src/Main.hs:24:3
    • In the equations for closed type family ‘Injective2’
      In the type family declaration for ‘Injective2’
   |
24 |   Injective2 Int = Injective1 Bool
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
