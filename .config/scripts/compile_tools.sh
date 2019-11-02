set -ex
PREFIX=$HOME/.apps/$(distguesser)
export PYTHONUSERBASE=$HOME/.local/pylibs-$(distguesser)
export PREFIX=$HOME/.apps/$(distguesser)
export HOSTNAME=$(hostname)
export X509_USER_PROXY=~/.globus/x509up

[[ -d $PREFIX ]] || mkdir -p $PREFIX
CORES=8
INSTALL_ZSH=1
INSTALL_PIP=1
INSTALL_TMUX=1
INSTALL_GIT=1


#[[ -d /cvmfs/ ]] && source /cvmfs/sft.cern.ch/lcg/views/LCG_94/x86_64-slc6-gcc8-opt/setup.sh


if [[ "$INSTALL_ZSH" == 1 ]];then
    wget https://sourceforge.net/projects/zsh/files/zsh/5.7.1/zsh-5.7.1.tar.xz/download
    tar -xJf download
    rm download
    mv zsh-5.7.1 zshtmp
    pushd zshtmp
    ./Util/preconfig
    ./configure --prefix=$PREFIX
    make -j$CORES
    make install
    popd
    rm -r zshtmp
fi
if [[ "$INSTALL_TMUX" == 1 ]];then
    
        TMUX_VERSION=2.9a
        LIBEVENT_VERSION=2.1.8-stable
        NCURSES_VERSION=6.1
    
        # create our directories
        mkdir -p $HOME/tmux_tmp
        cd $HOME/tmux_tmp
    
        # download all the files
        wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
        wget https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}/libevent-${LIBEVENT_VERSION}.tar.gz
        wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz

	############
        # libevent #
        ############
        tar xvzf libevent-${LIBEVENT_VERSION}.tar.gz
        cd libevent-${LIBEVENT_VERSION}
        ./configure --prefix=$PREFIX --disable-shared
        make
        make install
        cd ..

        ############
        # ncurses  #
        ############
        tar xvzf ncurses-${NCURSES_VERSION}.tar.gz
        cd ncurses-${NCURSES_VERSION}
        ./configure --prefix=$PREFIX
        make
        make install
        cd ..

        ############
        # tmux     #
        ############
        tar xvzf tmux-${TMUX_VERSION}.tar.gz
        cd tmux-${TMUX_VERSION}
        ./configure CFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses" LDFLAGS="-L$PREFIX/lib -L$PREFIX/include/ncurses -L$PREFIX/include"
        CPPFLAGS="-I$PREFIX/include -I$PREFIX/include/ncurses" LDFLAGS="-static -L$PREFIX/include -L$PREFIX/include/ncurses -L$PREFIX/lib" make
        cp tmux $PREFIX/bin
        cd ..

        cd $HOME

        # cleanup
	rm -rf $HOME/tmux_tmp
fi

if [[ "$INSTALL_GIT" == 1 ]];then
    git clone --depth 1 https://git.kernel.org/pub/scm/git/git.git gittmp
    pushd gittmp
    make configure
    ./configure --prefix=$PREFIX
    make all -j$CORES
    make install
    popd
    rm -rf gittmp
fi
if [[ "$INSTALL_PIP" == 1 ]];then
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python2.7 get-pip.py --user
    rm get-pip.py
    pip install --user powerline-status
fi

