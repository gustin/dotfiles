eval "$(rbenv init -)"

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_FREE_MIN=500000
export RUBY_GC_HEAP_FREE_SLOTS=50000
#export RUBY_HEAP_MIN_SLOTS=40000
export RUBY_GC_HEAP_INIT_SLOTS=40000
