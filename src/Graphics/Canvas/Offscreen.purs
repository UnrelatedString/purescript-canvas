module Graphics.Canvas.Offscreen
 ( OffscreenCanvas
 , createOffscreenCanvas
 , getHeight
 , getWidth
 , toBlob
 --, toBlob'
 , getContext2D
 -- , toImageBitmap
 ) where

import Effect (Effect)
import Web.File.Blob (Blob)
import Graphics.Canvas (Context2D)
import Data.Function.Uncurried (Fn2, runFn2)

-- | An OffscreenCanvas object, representing a virtual canvas which does not exist
-- | in the document and will not be rendered.
foreign import data OffscreenCanvas :: Type

foreign import createOffscreenCanvasImpl :: Fn2 Int Int (Effect OffscreenCanvas)

-- | Creates a virtual canvas with the given width and height.
createOffscreenCanvas :: Int -> Int -> Effect OffscreenCanvas
createOffscreenCanvas = runFn2 createOffscreenCanvasImpl

-- | Gets the logical height in pixels of the virtual canvas.
foreign import getHeight :: OffscreenCanvas -> Effect Int

-- | Gets the logical width in pixels of the virtual canvas.
foreign import getWidth :: OffscreenCanvas -> Effect Int

-- | Creates a `Blob` of the image data on the virtual canvas, as a PNG file.
foreign import toBlob :: OffscreenCanvas -> Effect Blob

-- -- | Creates a `Blob` of the image data on the virtual canvas, in the specified format.
-- TODO: add blob stuff to normal canvas too ;_; because I feel like this merits a type for
-- both restricting MediaTypes and for capturing which ones do and don't take a quality

-- | Get the 2D graphics context for a virtual canvas element.
foreign import getContext2D :: OffscreenCanvas -> Effect Context2D

-- TODO: focus long enough to figure out the image bitmap thing
