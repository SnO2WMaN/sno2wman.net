let siteconf = ./types/package.dhall

let Social = siteconf.Social

in  [ Social::{
      , link = "https://scrapbox.io/sno2wman"
      , service = "Scrapbox"
      , alias = Some "Internet Explorer 2.0"
      , description = Some "私的領域"
      }
    , Social::{
      , link = "https://twitter.com/SnO2WMaN"
      , service = "Twitter"
      , description = Some "コミュニケーションツール(1)"
      }
    , Social::{
      , link = "https://github.com/SnO2WMaN"
      , service = "GitHub"
      , description = Some "制作物(1)"
      }
    , Social::{
      , link = "mailto:me@sno2wman.net"
      , service = "email"
      , description = Some "重要連絡"
      }
    ]
