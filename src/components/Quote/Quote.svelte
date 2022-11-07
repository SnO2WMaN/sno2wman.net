<script lang="ts">
  import clsx from "clsx";
  import quotes from "~/data/quotes.json";

  let quote = quotes[Math.floor(Math.random() * quotes.length)];
</script>

<figure>
  <blockquote
    class={clsx(
      ["text-sm"],
      ["italic"],
      ["text-slate-800", "dark:text-slate-400"]
    )}
    cite={quote.link}
  >
    {quote.text}
  </blockquote>
  <figcaption
    class={clsx(["text-xs"], ["text-slate-600", "dark:text-slate-500"])}
  >
    —<a href={quote.link}>{quote.reference}</a>
  </figcaption>
</figure>

<style>
  figure {
    animation: blur 0.5s ease-in-out 0.25s both;
  }

  @keyframes blur {
    from {
      opacity: 0;
      transform: translateX(-8px);
    }
    to {
      opacity: 1;
    }
  }
</style>
