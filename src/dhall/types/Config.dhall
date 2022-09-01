let Boost = ./Boost.dhall

let Website = ./Website.dhall

let Quote = ./Quote.dhall

let Social = ./Social.dhall

let Link = ./Link.dhall

in  { Type =
        { quotes : List Quote.Type
        , boost : List Boost.Type
        , social : List Social.Type
        , websites : List Website.Type
        , sourcedOn : Link.Type
        , licencedBy : Link.Type
        , hostedBy : Link.Type
        }
    , default =
      { quotes = [] : List Quote.Type
      , boost = [] : List Boost.Type
      , social = [] : List Social.Type
      , websites = [] : List Website.Type
      }
    }
