export SSL_CERT_FILE='/usr/local/etc/openssl/cert.pem'

export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$HOME/.volta/bin/:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$PATH:$HOME/.bin/"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/postgresql@15/lib/pkgconfig"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

#. $HOME/.asdf/asdf.sh

