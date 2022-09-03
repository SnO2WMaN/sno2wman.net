let siteconf = ./types/package.dhall

let Contact = siteconf.Contact

in  [ Contact::{
      , link = "https://scrapbox.io/sno2wman"
      , service = "Scrapbox"
      , alias = Some "Internet Explorer 2.0"
      , description = Some "私的領域"
      }
    , Contact::{
      , link = "https://twitter.com/SnO2WMaN"
      , service = "Twitter"
      , description = Some "コミュニケーションツール(1)"
      }
    , Contact::{
      , link = "https://github.com/SnO2WMaN"
      , service = "GitHub"
      , description = Some "制作物(1)"
      }
    , Contact::{
      , link = "mailto:me@sno2wman.net"
      , service = "email"
      , description = Some "重要連絡"
      }
    ]
