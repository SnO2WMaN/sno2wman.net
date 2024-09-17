/** @type {import('tailwindcss').Config} */
export default {
	content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
	theme: {
		extend: {
      fontFamily: {
        "serif": ["BIZ UDPMincho", 'sans-serif'],
        "sans": ['Shippori Antique B1', 'serif'],
        "crimson-pro" : ['Crimson Pro Display Variable', 'serif'],
        "red-hat-display": ['Red Hat Display Variable', 'sans-serif'],
      },
    },
	},
	plugins: [],
}
