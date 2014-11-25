FROM centos:centos6

RUN yum install -y tar git hg rpmdevtools gcc glibc-static device-mapper-devel
RUN rpm -ivh http://ftp.iij.ad.jp/pub/linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y pandoc 'golang(github.com/gorilla/mux)' 'golang(github.com/kr/pty)' 'golang(code.google.com/p/go.net/websocket)' 'golang(code.google.com/p/gosqlite/sqlite3)' 'golang(github.com/syndtr/gocapability/capability)' 'golang(github.com/godbus/dbus)' 'golang(github.com/coreos/go-systemd)' 'golang(github.com/tchap/go-patricia/patricia)'

ADD rpmbuild /rpmbuild
RUN wget -P /rpmbuild/SOURCES https://github.com/docker/docker/archive/v1.3.2.tar.gz
RUN rpmbuild -bb /rpmbuild/SPECS/docker-io.spec -D "_topdir /rpmbuild"
