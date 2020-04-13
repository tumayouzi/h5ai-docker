# h5ai dcoker

## What's is h5ai

[h5ai](https://larsjung.de/h5ai/) is a modern file indexer for HTTP web servers with focus on your files.  
See the [demo directory](https://larsjung.de/h5ai/demo/) with most features enabled.

## Usage
```sh
 docker run -it --rm -p 80:80 -v '/pass/to/share/dir:/var/www' tumayouzi/h5ai-docker
```
You can now point your webbrowser to this URL:
```
http://localhost/
```

This is a rather common setup following docker's conventions:

 - `-it` will run an interactive session that can be terminated with CTRL+C
 - `--rm` will run a temporary session that will make sure to remove the container on exit
 - `-v {AnyDirectory}:/var/www` will mount the given directory as the base directory for the browsable directory index
 - `-p {OutsidePort}:80` will bind the webserver to the given outside port
 - `tumayouzi/h5ai-docker` the name of this docker image

## docker-compsoe

If you want to use docker-compose, use `docker-compose.yml`.  

command:
```sh
dokcer-compose up -d
```

## License

MIT.
