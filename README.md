# OpenIM Base Image

+ [OpenIM Base Image](https://github.com/openim-sigs/openim-base-image/actions)

Here, we provide a pre-configured Docker base image that forms the foundation for running and building OpenIM applications in Docker environments. It's designed with simplicity, efficiency, and ease-of-use in mind.

This base image, available on GitHub Container Registry, Docker Hub, and Alibaba Cloud, is based on Alpine Linux and includes pre-installed tools such as timezone data, bash, and certificates for streamlined application deployment.

## 📚 Table of Contents

- [OpenIM Base Image](#openim-base-image)
  - [📚 Table of Contents](#-table-of-contents)
  - [🔭 Supported Architectures](#-supported-architectures)
  - [🛠 Usage](#-usage)
  - [🤝 Contribution](#-contribution)
  - [📄 License](#-license)
  - [🌟 Acknowledgments](#-acknowledgments)


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

## OpenIM Env

```bash
c8e72f3e929d:/openim/openim-chat# env | grep "OPENIM"
------------------------------------------------------------------
OPENIM_CHAT_CMDDIR=/openim/openim-chat/scripts
OPENIM_OPENKF_CMDDIR=/openim/openkf/scripts
OPENIM_SERVER_CMDDIR=/openim/openim-server/scripts
OPENIM_CHAT_CONFIG_NAME=/openim/openim-chat/config/config.yaml
OPENIM_SERVER_CONFIG_NAME=/openim/openim-server/config/config.yaml
OPENIM_OPENKF_CONFIG_NAME=/openim/openkf/config/config.yaml
```

## 🎯 build
```
root@PS2023EVRHNCXG:~/workspaces/openim/openim-sigs/openim-base-image# docker images | grep base
openim-base-image          latest            2ea693677ba8   29 minutes ago      11MB
root@PS2023EVRHNCXG:~/workspaces/openim/openim-sigs/openim-base-image# docker run -it 2ea693677ba8 bash
264f4f21bb7f:/openim# pwd
/openim
264f4f21bb7f:/openim# tree
.
├── openim-chat
│   ├── bin
│   ├── config
│   ├── logs
│   ├── scripts
│   └── sdk
├── openim-server
│   ├── bin
│   ├── config
│   ├── logs
│   ├── scripts
│   └── sdk
└── openkf
    ├── bin
    ├── config
    ├── logs
    ├── scripts
    └── sdk
```

## 🤝 Contribution

Contributions to the OpenIM base image are welcomed and greatly appreciated. Please read our [contribution guide](./CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## 📄 License

This project is licensed under the [MIT License](./LICENSE) - see the [LICENSE](./LICENSE) file for details.

## 🌟 Acknowledgments

Thank you to all contributors who helped shape the OpenIM Base Image, making OpenIM applications more accessible and easier to deploy across various platforms.

Join us on our journey to make OpenIM even better! 🚀
