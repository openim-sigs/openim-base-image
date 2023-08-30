# OpenIM Base Image

+ [OpenIM Base Image](https://github.com/openim-sigs/openim-base-image/actions)

Here, we provide a pre-configured Docker base image that forms the foundation for running and building OpenIM applications in Docker environments. It's designed with simplicity, efficiency, and ease-of-use in mind.

This base image, available on GitHub Container Registry, Docker Hub, and Alibaba Cloud, is based on Alpine Linux and includes pre-installed tools such as timezone data, bash, and certificates for streamlined application deployment.

## 📚 Table of Contents

- [OpenIM Base Image](#openim-base-image)
  - [📚 Table of Contents](#-table-of-contents)
  - [✨ Support for multiple OS](#-suport-for-multiple-os)
  - [🔭 Supported Architectures](#-supported-architectures)
  - [🛠  Usage](#-usage)
  - [🤖 OpenIM Env](#openim-env)
  - [🎯 build](#-build)
  - [🤝 Contribution](#-contribution)
  - [📄 License](#-license)
  - [🌟 Acknowledgments](#-acknowledgments)


## ✨ Support for multiple OS

Support Ubuntu rootfs and more lightweight Alpine rootfs

+ [openim-bash-image](https://github.com/openim-sigs/openim-base-image/pkgs/container/openim-bash-image)
+ [openim-ubuntu-image](https://github.com/openim-sigs/openim-base-image/pkgs/container/openim-ubuntu-image)


## 🔭 Supported Architectures

The OpenIM base image supports a wide range of Linux architectures including:

- `linux/amd64`
- `linux/arm64`
- `linux/arm/v6`
- `linux/arm/v7`
- `linux/ppc64le`
- `linux/s390x`
- `linux/386`

## 🛠 Usage

About OpenIM Images Details: [https://github.com/OpenIMSDK/Open-IM-Server/blob/main/docs/conversions/images.md](https://github.com/OpenIMSDK/Open-IM-Server/blob/main/docs/conversions/images.md)

To use the OpenIM base image in your Dockerfile, simply specify it in the `FROM` directive. Here are the image paths for GitHub, Docker Hub, and Alibaba Cloud:

**GitHub Container Registry:**

```bash
FROM ghcr.io/openim-sigs/openim-bash-image:main
```

**Docker Hub:**

```bash
FROM openim/openim-bash-image:latest
```

**Alibaba Cloud:**

```bash
FROM registry.cn-hangzhou.aliyuncs.com/openimsdk/openim-bash-image:latest
```

After that, you can build your Docker image and run your OpenIM applications effortlessly!

## 🤖 OpenIM Env

**WORKDIR**
```bash
48aadaac962d:/openim# env | grep "WORKDIR"
------------------------------------------------------------------
CHAT_WORKDIR=/openim/openim-chat
OPENKF_WORKDIR=/openim/openkf
SERVER_WORKDIR=/openim/openim-server
```

**OPENIM-SERVER**
```bash
4dd91a700d3f:/openim# env | grep OPENIM_SERVER
------------------------------------------------------------------
OPENIM_SERVER_LOGDIR=/openim/openim-server/logs
OPENIM_SERVER_CONFIG_NAME=/openim/openim-server/config/config.yaml
OPENIM_SERVER_CMDDIR=/openim/openim-server/scripts
OPENIM_SERVER_BINDIR=/openim/openim-server/_output/bin
```

**OPENIM-CHAT**
```bash
4dd91a700d3f:/openim# env | grep OPENIM_CHAT
------------------------------------------------------------------
OPENIM_CHAT_CMDDIR=/openim/openim-chat/scripts
OPENIM_CHAT_CONFIG_NAME=/openim/openim-chat/config/config.yaml
OPENIM_CHAT_LOGDIR=/openim/openim-chat/logs
OPENIM_CHAT_BINDIR=/openim/openim-chat/bin
```

**OPENKF**
```bash
4dd91a700d3f:/openim# env | grep OPENIM_OPENKF
------------------------------------------------------------------
OPENIM_OPENKF_BINDIR=/openim/openkf/bin
OPENIM_OPENKF_CMDDIR=/openim/openkf/scripts
OPENIM_OPENKF_LOGDIR=/openim/openkf/logs
OPENIM_OPENKF_CONFIG_NAME=/openim/openkf/config/config.yaml
```

## 🎯 build
```
root@PS2023EVRHNCXG:~/workspaces/openim/openim-sigs/openim-base-image# docker images | grep base
openim-base-image          latest            2ea693677ba8   29 minutes ago      11MB
root@PS2023EVRHNCXG:~/workspaces/openim/openim-sigs/openim-base-image# docker run -it 2ea693677ba8 bash
264f4f21bb7f:/openim# pwd
/openim
4dd91a700d3f:/openim# tree
.
├── LICENSE
├── README.md
├── get_arch.sh
├── get_os.sh
├── openim-chat
│   ├── bin
│   ├── config
│   ├── logs
│   └── scripts
├── openim-server
│   ├── bin
│   ├── config
│   ├── logs
│   └── scripts
├── openkf
│   ├── bin
│   ├── config
│   ├── logs
│   └── scripts
├── source.sh
└── tools
```

## 🤝 Contribution

Contributions to the OpenIM base image are welcomed and greatly appreciated. Please read our [contribution guide](./CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## 📄 License

This project is licensed under the [MIT License](./LICENSE) - see the [LICENSE](./LICENSE) file for details.

## 🌟 Acknowledgments

Thank you to all contributors who helped shape the OpenIM Base Image, making OpenIM applications more accessible and easier to deploy across various platforms.

Join us on our journey to make OpenIM even better! 🚀
