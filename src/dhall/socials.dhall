let siteconf = ./types/package.dhall

let Social = siteconf.Social

in  [ Social::{
      , link = "https://www.haxibami"
      , name = "haxibami.net"
      , owner = "haxibami"
      , mutual = True
      }
    , Social::{
      , link = "https://not-miso-inside.netlify.app"
      , name = "みそは入ってませんけど"
      , owner = "一階堂洋"
      , mutual = True
      , description = Some "非常に混乱した文体"
      }
    , Social::{
      , link = "https://mikanixonable.github.io"
      , name = "人造日本人"
      , owner = "みかぶる"
      }
    , Social::{
      , link = "https://rinsuki.net"
      , name = "rinsuki.net"
      , owner = "りんすき"
      , mutual = True
      }
    , Social::{
      , link = "https://uynet.work"
      , name = "ゆいネット"
      , owner = "uynet"
      , description = Some "動きの滑らかさや細部への拘り"
      }
    , Social::{
      , link = "https://www.fabon.info"
      , name = "ふぁぼんのホームページ"
      , owner = "ふぁぼん"
      , mutual = True
      }
    , Social::{
      , link = "https://xeiaso.net"
      , name = "Xe Iaso"
      , owner = "Xe"
      , description = Some "Nixや様々なWeb技術、面白い試みなど"
      }
    , Social::{
      , link = "https://gfngfn.github.io/ja"
      , name = "gfnweb"
      , owner = "gfngfn"
      , description = Some "組版システムSATySFiの開発者"
      }
    , Social::{
      , link = "https://ryota-ka.me"
      , name = "ryota-ka.me"
      , owner = "Ryota Kameoka"
      , description = Some "ブログにNixなどの応用例など"
      }
    ]
