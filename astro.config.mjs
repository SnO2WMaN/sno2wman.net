import cloudflare from "@astrojs/cloudflare";
import svelte from "@astrojs/svelte";
import { defineConfig } from "astro/config";
import tailwindcss from "@tailwindcss/vite";

// https://astro.build/config
export default defineConfig({
  integrations: [svelte()],
  output: "server",
  adapter: cloudflare(),

  redirects: {
    "/projects": "/#projects",
    "/links": "/social",
    "/aboutme": "/",
  },
  vite: {
    plugins: [tailwindcss()],
  },
});
