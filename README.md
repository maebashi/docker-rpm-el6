## About

This is Dockerfile/spec/patches to create Docker RPM for CentOS6.

## Building

```
docker build -t docker-rpm-el6 .
docker run docker-rpm-el6 tar cf - -C /rpmbuild RPMS | tar xf -
```

or you can also do this:

```
$ docker run maebashi/docker-rpm-el6 tar cf - -C /rpmbuild RPMS | tar xf -
```
