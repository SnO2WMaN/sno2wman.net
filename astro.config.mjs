import cloudflare from "@astrojs/cloudflare";
import svelte from "@astrojs/svelte";
import tailwind from "@astrojs/tailwind";
import { defineConfig } from "astro/config";

// https://astro.build/config
export default defineConfig({
	integrations: [svelte(), tailwind()],
	output: "server",
	adapter: cloudflare(),
	redirects: {
		"/projects": "/#projects",
		"/links": "/#links",
		"/aboutme": "/",
	},
});
