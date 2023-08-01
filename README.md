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

To use the OpenIM base image in your Dockerfile, simply specify it in the `FROM` directive. Here are the image paths for GitHub, Docker Hub, and Alibaba Cloud:

**GitHub Container Registry:**

```
DockerfileCopy code
FROM ghcr.io/openim-sigs/openim-bash-image:main
```

**Docker Hub:**

```
DockerfileCopy code
FROM openim/openim-bash-image:latest
```

**Alibaba Cloud:**

```
DockerfileCopy code
FROM registry.cn-hangzhou.aliyuncs.com/openimsdk/openim-bash-image:latest
```

After that, you can build your Docker image and run your OpenIM applications effortlessly!

## 🤝 Contribution

Contributions to the OpenIM base image are welcomed and greatly appreciated. Please read our [contribution guide](./CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## 📄 License

This project is licensed under the [MIT License](./LICENSE) - see the [LICENSE](./LICENSE) file for details.

## 🌟 Acknowledgments

Thank you to all contributors who helped shape the OpenIM Base Image, making OpenIM applications more accessible and easier to deploy across various platforms.

Join us on our journey to make OpenIM even better! 🚀