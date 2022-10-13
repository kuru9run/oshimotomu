module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  daisyui: {
    theme: {
      container: {
        padding: {
          DEFAULT: '1rem',
          sm: '2rem',
          lg: '6rem',
          xl: '10rem',
          '2xl': '12rem',
        },
      },
    },
    themes: [
      {
        mytheme: {
          "primary": "#EC4899",
          "secondary": "#E58EFA",
          "accent": "#9ca3af",
          "neutral": "#FCB4E1",
          "base-100": "#FFFBF3",
          "info": "#9AD1FC",
          "success": "#B5C4F5",
          "warning": "#f9a8d4",
          "error": "#F84DC8",
        },
      },
    ],
  },
  plugins: [require("@tailwindcss/typography"), require("daisyui")],
}
