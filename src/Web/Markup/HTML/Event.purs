module Web.Markup.HTML.Event where
--------------------------------------------------------------------------------
import Prelude
import Web.Markup.Event
import Data.Foreign.Class (readProp)
import Control.Bind
import Data.Either

-- | An element has been clicked.
data Click = Click

instance clickUnitEvent :: Event Unit Click where
  eventName _ _ = "click"
  eventPayload _ _ = unit

-- | Text has been entered into an input field.
data Input = Input

instance inputStringEvent :: Event String Input where
  eventName _ _ = "input"
  eventPayload _ = either (const "") id <<< (readProp "value" <=< readProp "target")

-- | A checkbox got checked or unchecked.
data Checked = Checked

instance checkedBooleanEvent :: Event Boolean Checked where
  eventName _ _ = "change"
  eventPayload _ = either (const false) id <<< (readProp "checked" <=< readProp "target")
