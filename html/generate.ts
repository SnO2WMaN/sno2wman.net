import { configure as etaConfigure, renderFile } from "eta/mod.ts";
import { dirname, fromFileUrl } from "std/path/mod.ts";
import config from "../dhall/config.json" assert { type: "json" };

const rootDir = dirname(fromFileUrl(import.meta.url));

const etaConfig = etaConfigure({
  views: `${rootDir}/views/`,
});

const rendered = await renderFile(
  "./index.eta",
  config,
  etaConfig,
);

if (rendered) {
  await Deno.writeTextFile(
    `${rootDir}/index.html`,
    rendered,
  );
}
