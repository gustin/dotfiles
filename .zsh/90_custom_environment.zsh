export SSL_CERT_FILE='/usr/local/etc/openssl/cert.pem'

export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="$HOME/.volta/bin/:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="$PATH:$HOME/.bin/"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash


