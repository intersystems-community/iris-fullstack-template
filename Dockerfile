FROM store/intersystems/iris-community:2020.2.0.204.0

USER root

WORKDIR /opt/coffee

RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} .

COPY irissession.sh /

USER ${ISC_PACKAGE_MGRUSER}

COPY Installer.cls .

COPY src src
COPY web csp

SHELL ["/irissession.sh"]

RUN \
  do $SYSTEM.OBJ.Load("Installer.cls", "ck") \
  set sc = ##class(App.Installer).setup() \
  set ^|"COFFEE"|UnitTestRoot = "/opt/coffee/tests"

SHELL ["/bin/sh", "-c"]