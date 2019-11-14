FROM trestletech/plumber
MAINTAINER Dan Sterrett <dsterrett@canallc.com>

WORKDIR /app
COPY . .

# Install Packrat and install dependencies in packrat.lock
RUN install2.r packrat
RUN Rscript -e 'packrat::restore()'

CMD ["/app/plumber.r"]
