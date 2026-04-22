***************************
Emporia Energy Vue Exporter
***************************

This is an application for exporting usage metrics from the Emporia Energy Vue units.
This exporter utilizes the Emporia Energy Cloud, and the `PyEmVue`_ module.

This exporter retrieves energy usage for all channels on all devices registered to an
account. The energy usage will be the last minute's recorded usage in killowatt-hours (kWh).

The Emporia API is polled once each 60 seconds, thus there is no benefit to scraping the
exporter with Prometheus more frequently than 60 seconds.

Example metrics:

::

    # HELP emvue_device_energy_kwh Energy Usage for device
    # TYPE emvue_device_energy_kwh gauge
    emvue_device_energy_kwh{channel_name="Main",device_name="Home"} 0.006016770889494154
    emvue_device_energy_kwh{channel_name="Dryer",device_name="Home"} 0.0
    emvue_device_energy_kwh{channel_name="Air Conditioning",device_name="Home"} 0.0
    emvue_device_energy_kwh{channel_name="Living Room",device_name="Home"} 0.0008123266612158882
    emvue_device_energy_kwh{channel_name="Bahtroom",device_name="Home"} 0.0006453464963701035
    emvue_device_energy_kwh{channel_name="Kitchen",device_name="Home"} 0.004173242407904731
    emvue_device_energy_kwh{channel_name="Furnace",device_name="Home"} 0.00016466963026258677
    emvue_device_energy_kwh{channel_name="Balance",device_name="Home"} 0.00017345325509707162


.. _PyEmVue: https://github.com/magico13/PyEmVue

Installation
============

Easiest usage of this is to use the container image!

::

    docker run -it \
      -e EMVUE_EXPORTER_USERNAME=yourusernamehere \
      -e EMVUE_EXPORTER_PASSWORD=yourpasswordhere \
      -p 10110:10110 \
      registry.gitlab.com/shouptech/emvue_exporter


Then, point prometheus to your container host, at port 10110.

Configuration
=============

Configuration is done through environment variables.

* ``EMVUE_EXPORTER_USERNAME`` - *Required*, username to access the Emporia Energy portal.
* ``EMVUE_EXPORTER_PASSWORD`` - *Required*, password to access the Emporia Energy portal.
* ``EMVUE_EXPORTER_LOG_LEVEL`` - Logging level. Defaults to INFO.
* ``EMVUE_EXPORTER_PORT`` - Port number to listen on. Defaults to 10110.
* ``EMVUE_EXPORTER_POLL_DELAY`` - Delay in seconds between polls of the API. Defaults to 60.

Changelog
=========

0.1
----

Initial release
