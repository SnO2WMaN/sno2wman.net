let siteconf = ./dhall/types/package.dhall

let Config = siteconf.Config

let Link = siteconf.Link

in  Config::{
    , sourcedOn = Link::{
      , name = "GitHub"
      , link = "https://github.com/SnO2WMaN/sno2wman.net/tree/main"
      }
    , licencedBy = Link::{
      , name = "WTFPL"
      , link = "https://github.com/SnO2WMaN/sno2wman.net/tree/main/LICENSE"
      }
    , hostedBy = Link::{
      , name = "GitHub Pages"
      , link =
          "https://github.com/SnO2WMaN/sno2wman.net/actions/workflows/gh-pages.yml"
      }
    , quotes = ./dhall/quotes.dhall
    , websites = ./dhall/websites.dhall
    , boost = ./dhall/boost.dhall
    , social = ./dhall/social.dhall
    }
