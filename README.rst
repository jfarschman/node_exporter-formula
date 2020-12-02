.. _readme:

node_exporter-formula
=====================

This formula installs the node_exporter daemon .

.. contents:: **Table of Contents**
   :depth: 1


Overview
--------
`node_exporter-formula` loads the Prometheus node_exporter on Linux systems so
that metrics are exposed for collection by a Prometheus server. The end goal is
typically graphing, monitoring and alerting.


Available states
----------------
`node_exporter-formula` is safely called on any linux system by matching the
grain "kernel:Linux". It has the following states:

``node_exporter``
^^^^^^^^^^^^^^^^^

Installs the binaries, starts, and enables node_exporter service.

``node_exporter.config``
^^^^^^^^^^^^^^^^^^^^^^^^

Configures the node_exporter daemon.

``node_exporter.install``
^^^^^^^^^^^^^^^^^^^^^^^^

Installs the node_exporter binary.

``node_exporter.service``
^^^^^^^^^^^^^^^^^^^^^^^^

Configures the service.

Setup
-----
Refer to the defaults.yml file for a pillar configuration. In general, you will
to locate an appropriate binary and find the sha256 hash as a minimum.

Testing
-------

Linux testing is done with ``kitchen-salt`` using vagrant and bento boxes.

Requirements
^^^^^^^^^^^^

* Ruby
* vagrant
* virtualbox or fusion

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``bento/ubuntu-20.04``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates an instance and runs the ``node_exporter`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the instance(s).

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.


Limitations
-----------
Please note, we only aim support for the following distributions and versions.

* CentOS 7.x
* Redhat 7.x
* Ubuntu 16.04, 18.04, 20.04

Contributors
-----------
* Jay Farschman - jfarschman@gmail.com
