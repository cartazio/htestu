{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE CPP                      #-}

module Test.TestU.BatteryResult
( BatteryResultStruct(..)
) where

import Foreign.C.Types (CInt(..), CDouble(..))
import Foreign.Ptr (Ptr)
import Foreign.Storable

#include "bbattery.h"

-- | Structure holding an array of p-values after performing the testing
-- and their number
data BatteryResultStruct = BR {
  pValues :: Ptr CDouble,
  testNumber :: CInt
  } deriving (Eq, Show)

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

instance Storable BatteryResultStruct where
  sizeOf _ = (#size BatteryResult)
  alignment _ = #{alignment BatteryResult}
  peek ptr = do
    pValues <- (#peek BatteryResult, pValues) ptr
    testNumber <- (#peek BatteryResult, testNumber) ptr
    return $ BR pValues testNumber

  poke ptr (BR pValues testNumber) = do
    #{poke BatteryResult, pValues} ptr pValues
    #{poke BatteryResult, testNumber} ptr testNumber

