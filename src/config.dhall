let siteconf = ./dhall/types/package.dhall

let Config = siteconf.Config

let Link = siteconf.Link

in  Config::{
    , accessCounter = "https://count.getloli.com/get/@sno2wman.net?theme=rule34"
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
    , contacts = ./dhall/contacts.dhall
    , boosts = ./dhall/boosts.dhall
    , socials = ./dhall/socials.dhall
    }
