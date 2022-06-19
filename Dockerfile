FROM wordpress:6.0.0-php7.4-apache

# Install and enable Source Gaurdian loader

RUN mkdir /tmp/sourceguardian
COPY loaders.linux-x86_64.tar.gz /tmp/sourceguardian
RUN PHP_VERSION=$(php -v | head -n1 | cut -d' ' -f2 | cut -d. -f1-2) \
    && cd /tmp/sourceguardian \
    && tar xzf loaders.linux-x86_64.tar.gz \
    && cp ixed.${PHP_VERSION}.lin "$(php -i | grep '^extension_dir =' | cut -d' ' -f3)/sourceguardian.so" \
    && echo "extension=sourceguardian.so" > /usr/local/etc/php/conf.d/15-sourceguardian.ini \
    && rm -rf /tmp/sourceguardian



# RUN PHP_VERSION=$(php -v | head -n1 | cut -d' ' -f2 | cut -d. -f1-2) \
#    && mkdir -p /tmp/sourceguardian \
#    && cd /tmp/sourceguardian \
#    && curl -Os https://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz \
#    && tar xzf loaders.linux-x86_64.tar.gz \
#    && cp ixed.${PHP_VERSION}.lin "$(php -i | grep '^extension_dir =' | cut -d' ' -f3)/sourceguardian.so" \
#    && echo "extension=sourceguardian.so" > /usr/local/etc/php/conf.d/15-sourceguardian.ini
#  RUN rm -rf /tmp/sourceguardian
