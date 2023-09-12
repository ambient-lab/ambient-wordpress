# python のバージョンアップデートについて

python のバージョンをアップデートする際、下記の 3 箇所を合わせて更新する必要があります。

1. codespaces
2. lambda
3. AmplifyConsole

これらの python バージョンが共通するように　 fork 元やテンプレート元の更新があった場合は合わせて更新する必要があります。

## アップデート時の更新箇所

### codespaces

.devcontainer/devcontainer.json

```
"ghcr.io/devcontainers/features/python": {
"version": "3.10.13"
},
```

### lambda

amplify/backend/function/xxxxxxxx/xxxxxxxx-cloudformation-template.json

```
"Runtime": "python3.10",
"Layers": [],
"Timeout": 25
```

### AmplifyConsole

amplify.yml

```
- pyenv install ${PYTHON_VERSION:-3.10}
- pyenv global ${PYTHON_VERSION:-3.10}
```
