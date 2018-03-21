{-# LANGUAGE
    TypeFamilyDependencies
  , UndecidableInstances
  #-}

module Main where

type family NonInjective1 a where
  -- NonInjective1 a ~ Char ⇐ a ~ Bool ^ a ~ Int
  NonInjective1 Bool = Char
  NonInjective1 Int  = Char

type family NonInjective2 a where
  -- NonInjective2 a ~ Char ⇐ NonInjective2 a ~ NonInjective1 Bool ^ NonInjective1 a ~ NonInjective1 Int ⇔ a ~ Bool ^ a ~ Int
  NonInjective2 Bool = NonInjective1 Bool
  NonInjective2 Int  = NonInjective1 Bool

type family Injective1 a = r | r -> a where
  -- Injective1 a ~ Char ⇔ a ~ Bool
  Injective1 Bool = Char

type family Injective2 a = r | r -> a where
  -- Injective2 a ~ Char ⇔ Injective2 a ~ Injective1 Bool ⇔ a ~ Int
  Injective2 Int = Injective1 Bool

main :: IO ()
main = do
  putStrLn "hello world"
