library(shiny)
library(httpuv)

# Define the path to the directory containing your Doom game files
# doom_directory <- "./doom-wasm/src"
doom_directory <- "./doom-compiled"

# Start a server to serve Doom files
startServer("127.0.0.1", 1234, list(
  call = function(req) {
    filePath <- paste0(doom_directory, req$PATH_INFO)
    if (file.exists(filePath)) {
      return(list(
        status = 200,
        headers = list(
          "Content-Type" = "text/html"
        ),
        body = readBin(filePath, "raw", file.info(filePath)$size)
      ))
    } else {
      return(list(
        status = 404,
        headers = list(
          "Content-Type" = "text/html"
        ),
        body = "File not found"
      ))
    }
  }
))

ui <- fluidPage(
  tags$h1("Doom in Shiny"),
  tags$p("Space: fire; E: open door; up/down/left/right: move; 1-4: change weapon; Esc: release mouse/go to menu; F: full screen"),
  tags$iframe(style = "width:850px; height:640px;", src = "http://127.0.0.1:1234/index.html")
)

server <- function(input, output, session) { }

# Run the Shiny app
shinyApp(ui, server, options = list(port = 4321))
