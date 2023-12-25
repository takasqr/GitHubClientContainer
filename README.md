
## ビルド

`docker build -t github-client-container .`

## コンテナに入る

ホストとコンテナのディレクトリを連結させる。

`docker run -v ./source:/source -it github-client-container`

## GitHubにログイン

`gh auth login --with-token < mytoken.txt`

## ghのインストール

[https://github.com/cli/cli/blob/trunk/docs/install_linux.md]()


rootでログインすることになるので、`sudo`はなくす。

```
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
```

```
gh auth login

gh repo sync
```