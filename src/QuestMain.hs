module QuestMain where

-- Описание локаций
data Location = 
        Home 
        | Friend'sYard 
        | Garden
        | OtherRoom
     deriving (Eq, Show)

-- Куда идти по команде Walk или Go.
data Direction = 
        North 
        | South 
        | West 
        | East
     deriving (Eq, Show)
     
-- Действия игрока.
data Action = Look | Go | Inventory | Take | Drop | Investigate | Quit | Save | Load | New
        deriving (Eq, Show)

--Описание локации
describeLocation :: Location -> String
describeLocation location = show location ++ "\n" ++
        case location of
                Home            -> "You are standing in the middle room at the wooden table."
                Friend'sYard    -> "You are standing in the front of the night garden behind the small wooden fence."
                Garden          -> "You are in the garden. Garden looks very well: clean, tonsured, cool and wet."
                otherwise       -> "No description available for location with name " ++ show location ++ "."

--Путешествие между локациями
walk :: Location -> Direction -> Location
walk location direction = case location of
        Home -> case direction of
                North -> Garden
                South -> Friend'sYard
                West -> Home
                East -> Home
        Garden -> case direction of
                North -> Friend'sYard
                South -> Home
                West -> Garden
                East -> Garden
        Friend'sYard ->  case direction of
                North -> Home
                South -> Garden
                West -> Friend'sYard
                East -> Friend'sYard
        