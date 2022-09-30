module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  daisyui: {
    themes: [
      {
        mytheme: {
          "primary": "#63A1D9",
          "secondary": "#FCE58C",
          "accent": "#EEAF3A",
          "neutral": "#FF8991",
          "base-100": "#f3f4f6",
          "info": "#5eead4",
          "success": "#36D399",
          "warning": "#6b7280",
          "error": "#ec4899",
        },
      },
    ],
  },
  plugins: [require("@tailwindcss/typography"), require("daisyui")],
}
