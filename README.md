# Vagrant Riak Cluster

This is a Vagrant project powered by Chef to bring up a local Riak cluster.
Each node can run either `Ubuntu 12.04` or `CentOS 6.4` 64-bit with `1024MB`
of RAM by default. If you want to tune the OS or node/memory count, you'll
have to edit the `Vagrantfile` directly.

## Configuration

### Install Vagrant

Download and install Vagrant via the
[Vagrant installer](http://downloads.vagrantup.com/).

### Install Vagrant plugins

``` bash
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-omnibus
```

### Launch cluster

``` bash
$ vagrant up
```

### Accessing individual nodes

Each node in the cluster is named in the form `riakN` — where `N` is a number
between `1` and the number of nodes defined for the cluster (defaults to `3`).

``` bash
$ vagrant ssh riak1
```

## Vagrant boxes

The Vagrant boxes used in this project were created by
[Veewee](https://github.com/jedi4ever/veewee/). To view the Veewee definitions,
please follow the links below:

* [opscode-centos-6.4](https://github.com/opscode/bento/tree/master/definitions/centos-6.4)
* [opscode-ubuntu-12.04](https://github.com/opscode/bento/tree/master/definitions/ubuntu-12.04)

## How is this better than `make devrel`?

Standing up a local Riak cluster within Vagrant is better than `make devrel`
because:

* It installs Riak on the operating system you intend to deploy on in
  production
* It uses the actual packages you'll deploy with in production
* It allows you to test failure scenarios that include the machine (failed
  disks, network partitions, etc.)

## How is this worse than `make devrel`?

Standing up a local Riak cluster within Vagrant is worse than `make devrel`
because:

* It takes longer (minutes) to stand up a cluster
* It uses more resources on your local machine
* It involves VirtualBox
