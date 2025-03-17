module Graphics.Canvas.Offscreen
 ( OffscreenCanvas
 , createOffscreenCanvas
 , getHeight
 , getWidth
 , toBlob
 , toBlob'
 , getContext2D
 -- , toImageBitmap
 ) where

import Prelude 

import Effect (Effect)
import Web.File.Blob (Blob)
import Graphics.Canvas (Context2D, BlobFormat(..))
import Data.MediaType (MediaType(..))
import Data.Function.Uncurried (Fn2, Fn3, runFn2, runFn3)
import Effect.Aff (Aff)
import Control.Promise (Promise, toAffE)

-- | An OffscreenCanvas object, representing a virtual canvas which does not exist
-- | in the document and will not be rendered.
foreign import data OffscreenCanvas :: Type

-- | Creates a virtual canvas with the given width and height.
foreign import createOffscreenCanvas :: { width :: Int, height :: Int } -> (Effect OffscreenCanvas)

-- | Gets the logical height in pixels of the virtual canvas.
foreign import getHeight :: OffscreenCanvas -> Effect Int

-- | Gets the logical width in pixels of the virtual canvas.
foreign import getWidth :: OffscreenCanvas -> Effect Int

foreign import toBlobDefault :: OffscreenCanvas -> Effect (Promise Blob)

-- | Create a `Blob` of the image data on the virtual canvas, as a PNG file.
toBlob :: OffscreenCanvas -> Aff Blob
toBlob = toAffE <<< toBlobDefault

foreign import toBlobFormat :: Fn2 String OffscreenCanvas (Effect (Promise Blob))
foreign import toBlobFormatQuality :: Fn3 String Number OffscreenCanvas (Effect (Promise Blob))

-- | Create a `Blob` of the image data on the virtual canvas, in the specified format.
toBlob' :: BlobFormat -> OffscreenCanvas -> Aff Blob
toBlob' (Lossless (MediaType format)) = toAffE <<< runFn2 toBlobFormat format
toBlob' (Lossy (MediaType format) quality) = toAffE <<< runFn3 toBlobFormatQuality format quality

-- | Get the 2D graphics context for a virtual canvas element.
-- | Although this is a different type (`OffscreenCanvasRenderingContext2D`)
-- | in the underlying JavaScript, `Context2D` does not expose any of the
-- | discrepancies in functionality.
foreign import getContext2D :: OffscreenCanvas -> Effect Context2D

-- TODO: focus long enough to figure out the image bitmap thing
