module Pages.Home_ exposing (page)

import Color
import Element exposing (Element, centerX, centerY, clip, column, el, fill, height, htmlAttribute, image, layout, paddingXY, paragraph, px, rgb255, rgba255, shrink, spacing, text, width)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font exposing (bold, center, color, size)
import Element.Region exposing (heading)
import Html.Attributes exposing (style)
import View exposing (View)


fontOutfit : Element.Attribute msg
fontOutfit =
    Font.family [ Font.typeface "Outfit" ]


white =
    rgb255 255 255 255


toElementColor : Color.Color -> Element.Color
toElementColor color =
    Element.fromRgb (Color.toRgba color)



-- - Slate 300: hsl(212, 45%, 89%)
-- - Slate 500: hsl(216, 15%, 48%)
-- - Slate 900: hsl(218, 44%, 22%)


slate300 : Color.Color
slate300 =
    Color.hsl 212 0.45 0.89


slate500 : Color.Color
slate500 =
    Color.hsl 216 0.15 0.48


slate900 : Color.Color
slate900 =
    Color.hsl 218 0.44 0.22



-- Convert to elm-ui Element.Color


slate300Element : Element.Color
slate300Element =
    toElementColor slate300


slate500Element : Element.Color
slate500Element =
    toElementColor slate500


slate900Element : Element.Color
slate900Element =
    toElementColor slate900


page : View msg
page =
    { title = "Homepage"
    , body =
        [ layout
            [ Background.color slate300Element
            , fontOutfit
            ]
            qrCard
        ]
    }


qrCard : Element msg
qrCard =
    column
        [ Element.paddingEach { top = 16, right = 16, bottom = 40, left = 16 }
        , spacing 24
        , Background.color white
        , width (px 320)
        , height shrink
        , Border.rounded 20
        , centerX
        , centerY
        , Border.shadow
            { offset = ( 0, 25 )
            , size = 0
            , blur = 25
            , color = rgba255 0 0 0 0.0477
            }
        ]
        [ qrCodeImage
        , cardDescription
        ]


qrCodeImage : Element msg
qrCodeImage =
    el
        [ width (px 288)
        , height (px 288)
        , Border.rounded 10
        , clip
        ]
        (image
            [ width fill
            , height fill
            ]
            { src = "./image-qr-code.png"
            , description = "qr code"
            }
        )


cardDescription : Element msg
cardDescription =
    column [ width fill, paddingXY 16 0, height shrink, spacing 16 ]
        [ paragraph
            [ heading 1
            , width fill
            , height (px 52)
            , center
            , bold
            , color slate900Element
            , size 22
            , clip
            , htmlAttribute (style "line-height" "1.2")
            ]
            [ text "Improve your front-end skills by building projects" ]
        , paragraph
            [ color slate500Element
            , center
            , size 15
            , height (px 63)
            , htmlAttribute (style "line-height" "1.4")
            ]
            [ text "Scan the QR code to visit Frontend Mentor and take your coding skills to the next level" ]
        ]
