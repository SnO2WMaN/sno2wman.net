<script lang="ts">
  const what = 1 + Math.floor(Math.random() * 4);
</script>

<div>
  {#if what === 1 || what === 2}
    <p>
      <span>
        ある村の住人は，常に正直なことを話す<strong>正直者</strong
        >か，常に嘘をつく<strong>嘘つき</strong>か，必ずどちらかであるとします．
      </span>

      <span>
        この村に訪れたあなたは，最初に会った村人（<strong
          >SnO<sub>2</sub>WMaN</strong
        >としましょう）に<i>「あなたは正直者ですか，嘘つきですか？」</i
        >と尋ねたところ
        {#if what === 1}
          <i>「私は正直者です．」</i>
        {/if}
        {#if what === 2}
          <i>「私は嘘つきです．」</i>
        {/if}
        と答えられました．
      </span>
      <span>
        この村人は<strong>実際に</strong
        >正直者でしょうか？それとも嘘つきでしょうか？
      </span>
    </p>
  {/if}
  {#if what === 3}
    <p>
      次のものに興味があります．いくつかの項目には具体的なキーワードも付けておきます．ただし，私はここで挙がっているあらゆるものの専門家ではありません．
    </p>
    <ul>
      <li>
        Webフロントエンド開発
        <span class="keywords">
          <i>React</i>
          <i>Next.js</i>
        </span>
      </li>
      <li>
        再現性のある開発環境の構築
        <span class="keywords">
          <i>Nix</i>
          <i>Dev Container</i>
        </span>
      </li>
      <li>
        音MAD
        <span class="keywords">
          <i>Otomadb</i>
        </span>
      </li>
      <li>
        論理学
        <span class="keywords">
          <i>様相論理</i>
          <i>認識論理</i>
          <i>Gödelの不完全性定理</i>
        </span>
      </li>
      <li>型理論</li>
      <li>
        定理証明支援系
        <span class="keywords">
          <i>LEAN</i>
        </span>
      </li>
      <li>計算理論</li>
      <li>
        分散システム
        <span class="keywords">
          <i>Kubernetes</i>
        </span>
      </li>
      <li>知識工学</li>
      <li>推薦システム</li>
      <li>検索システム</li>
    </ul>
  {/if}
  {#if what === 4}
    <p>TODO: ここに自己紹介を入力する</p>
  {/if}
</div>

<style lang="scss">
  div {
    & > p {
      font-size: 0.9rem;
      & > span {
        display: inline-block;
      }
      strong {
        font-weight: 700;
      }
      i {
        font-style: italic;
      }
    }
    & > ul {
      list-style: decimal;
      padding-inline-start: 1rem;
      padding-block-start: 0.25rem;
      padding-block-end: 0.25rem;
      & > li {
        font-size: 0.9rem;
        &::marker {
          color: var(--weak-text-color);
        }
        & > .keywords {
          display: inline-flex;
          margin-inline-start: 0.125rem;
          & > i {
            font-size: 0.8rem;
            color: var(--weak-text-color);
            font-style: italic;
            &:not(:first-of-type) {
              &::before {
                content: ",";
                font-style: normal;
              }
            }
          }
        }
      }
    }
  }
</style>
