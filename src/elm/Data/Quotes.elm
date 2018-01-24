module Data.Quotes exposing (..)

import Types exposing (..)


quoteMaker : Int -> String -> String -> Quote
quoteMaker int imgsrc quote =
    { id = int
    , imgsrc = imgsrc
    , quote = quote
    }


quotesList : List Quote
quotesList =
    [ quoteMaker 1 "./assets/woman1.png" "I had got into debt problems with an energy supplier. LWC helped to tackle the issue and managed to get £3,500 of debt written off"
    , quoteMaker 2 "./assets/woman2.png" "I didn't know which way to turn after a recent seperation. With LWC's help i now feels much more supported and know that help is always on hand for form filling , advice and money matters"
    , quoteMaker 3 "./assets/woman3.png" "I had worked in the same job for a number of years, but was struggling with bullying in the workplace. This impacted my Mental Health and ended up unemployed. through LWC I used services that helped me regain confidence and find a part time job."
    , quoteMaker 4 "./assets/woman4.png" "I attended living well therapy sessions and accessed Behavioural Activation which helped my negative thinking and emotions."
    , quoteMaker 5 "./assets/woman5.png" "I suffer from sciatica pain and a rotator cuff injury, which made me feel miserable. Attending Living Well sessions helped make me feel more motivated."
    , quoteMaker 6 "./assets/woman6.png" "I came into contact with LWC following release from Prison. An LWC caseworker helped me find new accommodation, made contact with the local alcohol support team and helped me claim benefits."
    ]
