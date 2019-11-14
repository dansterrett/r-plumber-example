path <- file.path(normalizePath(getwd()), "plumber.r")
r <- plumber::plumb(path)
r$run(host='0.0.0.0', port=8000)
