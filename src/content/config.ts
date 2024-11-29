import { defineCollection, z } from "astro:content";

const historyCollection = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    date: z.date(),
    title_link: z.string().optional(),
    description: z.string(),
    links: z.array(
      z.object({
        text: z.string(),
        url: z.string(),
      }),
    ),
  }),
});

export const collections = {
  history: historyCollection,
};
