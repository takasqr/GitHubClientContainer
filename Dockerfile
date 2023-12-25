# ベースとなるDockerイメージを指定
FROM ubuntu:latest

# パッケージの更新と必要なパッケージのインストール
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y curl

# ghのインストール
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y

# コンテナ内のディレクトリを作成
RUN mkdir -p /source

# コンテナが起動した時に実行されるコマンド
CMD ["bash"]
