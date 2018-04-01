![Docker Stars](https://img.shields.io/docker/stars/niedakh/scikit-multilearn-dev.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/niedakh/scikit-multilearn-dev.svg)
![Docker Automated build](https://img.shields.io/docker/automated/niedakh/scikit-multilearn-dev.svg)

A docker setup for developing scikit.ml, heavily inspired by https://github.com/GeographicaGS/Docker-Python_Development

This docker contains two python environments set for scikit-multilearn: 2.7 and 3.x, to use the first one run `python2` and `pip2`, the second is available via `python3` and `pip3`.

You can pull the latest version from Docker hub using:
```bash
$ docker pull niedakh/scikit-multilearn-dev:latest
```

You can start it via:
```bash
$ docker run -e "MEKA_CLASSPATH=/opt/meka/lib" -v "YOUR_CLONE_DIR:/home/python-dev/repo" --name scikit_multilearn_dev_test_docker -d niedakh/scikit-multilearn-dev:latest
```

To run the tests under the python 2.7 environment use:
```bash
$ docker exec -it scikit_multilearn_dev_test_docker python3 -m pytest /home/python-dev/repo
```

or for python 3.x use:
```bash
$ docker exec -it scikit_multilearn_dev_test_docker python2 -m pytest /home/python-dev/repo
```

To play around just login with:
```bash
$ docker exec -it scikit_multilearn_dev_test_docker python3 -m pytest /home/python-dev/repo
```

## Using via docker-compose
You can also build it with docker-compose while in the directory to which you cloned the repository - if you do so, you need to clone the repository and change the volume mappings. Afterwards just run:

```bash
$ docker-compose build
```

You can use it in pycharm with pycharm's docker-compose interpreter.