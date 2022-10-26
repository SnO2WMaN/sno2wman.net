<script lang="ts">
  import clsx from "clsx";
  import quotes from "./quotes.json";

  let quote = quotes[Math.floor(Math.random() * quotes.length)];
</script>

<blockquote
  class={clsx(
    ["text-sm"],
    ["italic"],
    ["text-slate-800", "dark:text-slate-400"]
  )}
>
  {quote.text}
</blockquote>
