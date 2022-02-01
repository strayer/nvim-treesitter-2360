FROM debian:bullseye

RUN apt-get update && \
  apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git && \
  rm -rf /var/lib/apt/lists

# good
# RUN git clone -b v0.6.1 https://github.com/neovim/neovim /usr/src/neovim
# first bad commit
RUN git clone https://github.com/neovim/neovim /usr/src/neovim && \
  cd /usr/src/neovim && \
  git checkout 45f7fc9b0607cde787dc8b70b6842aa2b4b56c31

WORKDIR /usr/src/neovim

RUN make && make install

RUN mkdir -p ~/.local/share/nvim/site/pack/plugins/start/ && \
  cd ~/.local/share/nvim/site/pack/plugins/start/ && \
  git clone https://github.com/nvim-treesitter/nvim-treesitter.git && \
  cd nvim-treesitter && \
  git checkout 647c55cb6f0bc6c81968ba9581d470455efe1548 && \
  nvim --headless "+TSInstallSync pug" +q && \
  nvim --headless "+TSInstallSync vue" +q

COPY example.vue /example.vue
COPY init.vim /root/.config/nvim/

CMD [ "nvim", "/example.vue" ]
