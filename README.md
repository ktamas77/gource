# gource
Gource Docker Image

### What is this?

It's a turn-key docker image for the popular [Gource](https://gource.io/) visualization tool.
The package also contains ffmpeg to aid video conversion.

### How to use it

```bash
docker pull ktamas77/gource
docker run -ti ktamas77/gource bash
gource <your commands here>
```

or

```
docker run ktamas77/gource gource <your commands here>
```

### AWS Codebuild setup

It's also possible to run this docker container in AWS Codebuild,
entirelly headless, without any display, for an example to render videos weekly.
Detailed Codebuild setup information is in the `buildspec.yml` file.
