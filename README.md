# factorio_docker_cookbook

This Cookbook deploys a Factorio Server using Docker.

- Add some Screenshots

## Customising the Factorio Deployment

To customise your factorio deployment, you can change options in the
`default.rb` in the attributes directory.  Below are some explanations
of some things you can customise.

### Customise the docker installation type

Change `default` to the desired installation type.
Ordinarily, you would not need to change this at all.

```
default['docker']['installation']['type'] = 'default'
```

### Set this to the correct docker hub repo where the factorio image is stored

```
default['docker']['image']['repo'] = 'factoriotools/factorio'
```

### The directory in the container which will be mapped to host

In normal circumstances, you probably should not change this option.

````
default['docker']['directory'] = '/factorio'
````

### Set this option for the container TCP port

````
default['docker']['tcp_port'] = '27015'
````

### Set this option for thecontainer UDP port

````
default['docker']['udp_port'] = '34197'
````

### Set this option to alter which Docker image is used

````
default['docker']['image']['tag'] = 'stable'
````

### Set this option to change the host TCP port which the docker port is mapped to

````
default['host']['tcp_port'] = '27015'
````

### Set this option to change the host UDP port which the docker port is mapped to

````
default['host']['udp_port'] = '34197'
````

### Set this to change where persistent data should be stored on the host machine

````
default['host']['directory'] = '/opt/factorio'
````

### Maintainers

to be added
