let siteconf = ./types/package.dhall

let Website = siteconf.Website

in  [ Website::{
      , link = "https://www.haxibami"
      , name = "haxibami.net"
      , owner = "haxibami"
      }
    , Website::{
      , link = "https://not-miso-inside.netlify.app"
      , name = "みそは入ってませんけど"
      , owner = "一階堂洋"
      }
    , Website::{
      , link = "https://mikanixonable.github.io"
      , name = "人造日本人"
      , owner = "みかぶる"
      }
    , Website::{
      , link = "https://rinsuki.net"
      , name = "rinsuki.net"
      , owner = "りんすき"
      }
    , Website::{ link = "https://uynet.work", name = "ゆいネット", owner = "uynet" }
    , Website::{
      , link = "https://www.fabon.info"
      , name = "ふぁぼんのホームページ"
      , owner = "ふぁぼん"
      }
    , Website::{ link = "https://xeiaso.net", name = "Xe Iaso", owner = "Xe" }
    , Website::{
      , link = "https://gfngfn.github.io/ja"
      , name = "gfnweb"
      , owner = "gfngfn"
      }
    , Website::{
      , link = "https://ryota-ka.me"
      , name = "ryota-ka.me"
      , owner = "Ryota Kameoka"
      }
    ]
