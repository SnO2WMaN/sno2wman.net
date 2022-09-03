let Boost = ./Boost.dhall

let Social = ./Social.dhall

let Quote = ./Quote.dhall

let Contact = ./Contact.dhall

let Link = ./Link.dhall

in  { Type =
        { accessCounter : Text
        , sourcedOn : Link.Type
        , licencedBy : Link.Type
        , deployedTo : Link.Type
        , quotes : List Quote.Type
        , boosts : List Boost.Type
        , contacts : List Contact.Type
        , socials : List Social.Type
        }
    , default =
      { quotes = [] : List Quote.Type
      , boosts = [] : List Boost.Type
      , contacts = [] : List Contact.Type
      , socials = [] : List Social.Type
      }
    }
