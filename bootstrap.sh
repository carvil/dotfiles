echo ""
echo "\033[32m(  __  \ (  ___  )\__   __/(  ____ \\__   __/( \      (  ____ \(  ____ \ \033[0m"
echo "\033[32m| (  \  )| (   ) |   ) (   | (    \/   ) (   | (      | (    \/| (    \/ \033[0m"
echo "\033[32m| |   ) || |   | |   | |   | (__       | |   | |      | (__    | (_____  \033[0m"
echo "\033[32m| |   | || |   | |   | |   |  __)      | |   | |      |  __)   (_____  ) \033[0m"
echo "\033[32m| |   ) || |   | |   | |   | (         | |   | |      | (            ) | \033[0m"
echo "\033[32m| (__/  )| (___) |   | |   | )      ___) (___| (____/\| (____/\/\____) | \033[0m"
echo "\033[32m(______/ (_______)   )_(   |/       \_______/(_______/(_______/\_______) \033[0m"
echo ""

BASE_DIR=~
DOT_FILES_DIR=$BASE_DIR/dotfiles

function symlink_dotfiles {
  echo "\033[32m  => Creating symlinks... \033[0m"
  cd $DOT_FILES_DIR
  for file in symlinks/*
  do
      file_name=`basename $file`
      dest_file=~/.$file_name
      if [ -f $dest_file ] || [ -d $dest_file ]; then
          echo "Destination file $dest_file exists! Moving it to /tmp/"
          mv -f $dest_file /tmp/$file_name
      fi
      echo "Creating symlink for $file"
      ln -s $DOT_FILES_DIR/$file $dest_file
  done
}

function clone_dotfiles_repo {
  echo "\033[32m  => Cloning dotfiles repo to $BASE_DIR \033[0m"
  if [ -d "$BASE_DIR/dotfiles" ]; then
      echo '\033[32m    + Repo exists, fetching latest changes \033[0m'
      cd $BASE_DIR/dotfiles
      git reset --hard
      git checkout master
      git pull origin master
  else
      cd $BASE_DIR
      git clone git@github.com:carvil/dotfiles.git
  fi
}

function finish {
  echo '\033[32m  => Finishing up \033[0m'
  echo '\033[32m    + Copying bash completion into place \033[0m'
  cp $DOT_FILES_DIR/git-completion.bash $BASE_DIR
  echo '\033[32m    + Now, install the fonts and the zsh theme manually! \033[0m'
  echo "\033[32m  => Done! \033[0m"
}

function setup_vim {
  echo '\033[32m  => Setup .vim \033[0m'
  echo '\033[32m    + Creating directories (bundle,tmp,backup,autoload) \033[0m'
  mkdir -p $BASE_DIR/.vim/{bundle,tmp,backup,autoload}
  echo '\033[32m    + Cloning vundle \033[0m'
  git clone https://github.com/gmarik/vundle.git $BASE_DIR/.vim/bundle/vundle
  echo '\033[32m    + Installing bundle \033[0m'
  vim -u ~/.vimrc - +BundleInstall +BundleClean +qall
  finish
}

clone_dotfiles_repo
symlink_dotfiles
setup_vim
