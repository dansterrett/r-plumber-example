# To build image, run `docker build -t dansterrett/r-plumber-example .`
# To run the image, run: `docker run --rm --detach -p 8000:8000 dansterrett/r-plumber-example:latest`
# This Dockerfile expects a file named `plumber.r` in the root of the project to be the entry point of the app.

FROM dansterrett/r-plumber-packrat:3.6.1

# Create a working directory
WORKDIR /app

# Copy files into the working directory
COPY . .

# Install dependencies using packrat
RUN Rscript -e 'packrat::restore()'

# Expose port 8000
EXPOSE 8000

# Start the app
# CMD ["Rscript", "/app/index.r"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=8000)"]
CMD ["/app/plumber.r"]
