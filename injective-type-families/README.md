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

For a type family that isn’t actually injective but is defined as injective, it does appear to (correctly) identify the non-injectivity, too.

```
/$HOME/Projects/issues/injective-type-families/src/Main.hs:33:3: error:
    • Type family equation violates injectivity annotation.
      RHS of injective type family equation cannot be a type family:
        Injective3 Int = Injective1 Bool
          -- Defined at /$HOME/Projects/issues/injective-type-families/src/Main.hs:33:3
    • In the equations for closed type family ‘Injective3’
      In the type family declaration for ‘Injective3’
   |
33 |   Injective3 Int  = Injective1 Bool
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

/$HOME/Projects/issues/injective-type-families/src/Main.hs:33:3: error:
    • Type family equations violate injectivity annotation:
        Injective3 Int = Injective1 Bool
          -- Defined at /$HOME/Projects/issues/injective-type-families/src/Main.hs:33:3
        Injective3 Bool = Char
          -- Defined at /$HOME/Projects/issues/injective-type-families/src/Main.hs:34:3
    • In the equations for closed type family ‘Injective3’
      In the type family declaration for ‘Injective3’
   |
33 |   Injective3 Int  = Injective1 Bool
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

Injective4 is actually injective but is rejected with the same error as Injective3.
NonInjective4 is actually injective but doesn’t declare that injectivity and is accepted.

```
/$HOME/Projects/issues/injective-type-families/src/Main.hs:38:3: error:
    • Type family equation violates injectivity annotation.
      RHS of injective type family equation cannot be a type family:
        Injective4 Int = Injective1 Bool
          -- Defined at /$HOME/Projects/issues/injective-type-families/src/Main.hs:38:3
    • In the equations for closed type family ‘Injective4’
      In the type family declaration for ‘Injective4’
   |
43 |   Injective4 Int  = Injective1 Bool
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

/$HOME/Projects/issues/injective-type-families/src/Main.hs:38:3: error:
    • Type family equations violate injectivity annotation:
        Injective4 Int = Injective1 Bool
          -- Defined at /$HOME/Projects/issues/injective-type-families/src/Main.hs:38:3
        Injective4 Bool = ()
          -- Defined at /$HOME/Projects/issues/injective-type-families/src/Main.hs:39:3
    • In the equations for closed type family ‘Injective4’
      In the type family declaration for ‘Injective4’
   |
43 |   Injective4 Int  = Injective1 Bool
   |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```
