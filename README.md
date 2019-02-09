# Project

Docker project for a typical Coconut environment, including support for Jupyter Notebook.

[![Docker Pulls](https://img.shields.io/docker/pulls/andreburgaud/coconut.svg)](https://hub.docker.com/r/andreburgaud/coconut/)
[![Docker Automated Build](https://img.shields.io/docker/automated/andreburgaud/coconut.svg)](https://hub.docker.com/r/andreburgaud/coconut/)
[![Docker Build Status](https://img.shields.io/docker/build/andreburgaud/coconut.svg)](https://hub.docker.com/r/andreburgaud/coconut/)
[![Layers](https://images.microbadger.com/badges/image/andreburgaud/coconut.svg)](https://microbadger.com/images/andreburgaud/coconut)
[![Version](https://images.microbadger.com/badges/version/andreburgaud/coconut.svg)](https://microbadger.com/images/andreburgaud/coconut)
[![Tag](https://img.shields.io/github/tag/andreburgaud/docker-coconut.svg)](https://github.com/andreburgaud/docker-coconut/tags)

# Coconut

Coconut is a functional programming language that compiles to Python. Since all valid Python is valid Coconut, using Coconut will only extend and enhance what you're already capable of in Python.

For more details about Coconut, visit the following pages:

* http://coconut-lang.org/ Coconut Home Page
* http://coconut.readthedocs.io/en/master/DOCS.html Coconut Documentation

# Pull Coconut Image

```
$ docker pull andreburgaud/coconut
```

# Run a Coconut shell

```
$ docker run -it --rm andreburgaud/coconut
Coconut Interpreter:
(type 'exit()' or press Ctrl-D to end)
>>> exit()
```

# Run Coconut shell with specific options

* `--target 36`: support for the latest Python 3 syntax such as `f-string`.

```
$ docker run --rm -it andreburgaud/coconut coconut --target 36
Coconut Interpreter:
(type 'exit()' or press Ctrl-D to end)
>>> import sys
>>> from coconut import root
>>> f'Coconut {root.VERSION_STR}' |> print
Coconut 1.4.0 [Ernest Scribbler]
>>> 'Python {}.{}.{}'.format(*sys.version_info[:3]) |> print
Python 3.7.2
>>> exit()
```

# Start Jupyter notebook

Notebooks will appears in the host current directory (`/notebooks` in the container)

```
$ docker run -it --rm -v`pwd`:/notebooks -p 8888:8888 andreburgaud/coconut coconut --target 36 --jupyter notebook --ip 0.0.0.0 --no-browser
Coconut: Successfully installed Coconut Jupyter kernel.
[I 04:37:23.521 NotebookApp] Writing notebook server cookie secret to /home/jupyter/.local/share/jupyter/runtime/notebook_cookie_secret
[I 04:37:23.730 NotebookApp] Serving notebooks from local directory: /notebooks
[I 04:37:23.730 NotebookApp] The Jupyter Notebook is running at:
[I 04:37:23.730 NotebookApp] http://(473a153c8d00 or 127.0.0.1):8888/?token=5d03ad7258d6f720c42c5ecab33d62c77693a69ff0ebe434
[I 04:37:23.731 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 04:37:23.734 NotebookApp]

    To access the notebook, open this file in a browser:
        file:///home/jupyter/.local/share/jupyter/runtime/nbserver-28-open.html
    Or copy and paste one of these URLs:
        http://(473a153c8d00 or 127.0.0.1):8888/?token=5d03ad7258d6f720c42c5ecab33d62c77693a69ff0ebe434
```

From the output of the example above, open the host browser with the following URL:

http://127.0.0.1:8888/?token=5d03ad7258d6f720c42c5ecab33d62c77693a69ff0ebe434

# Start the default container shell

```
$ docker run -it --rm andreburgaud/coconut sh
/notebooks $
```
