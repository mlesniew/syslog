# syslog container image

This container image provides a straightforward way to set up a syslog server.  It listens on port 514 (TCP and UDP) and prints all received logs to stdout.  This makes it easy to retrieve and monitor logs from the container using the `docker logs` command without the need to mount any volumes.


## Usage

To run the container, use the following command:

```bash
docker run --rm -p 514:514/tcp -p 514:514/udp mlesniew/syslog
```

This will run the container in the foreground, printing all logs immediately.  To run it in the background, use `docker run` with the `-d` switch.


## Accessing Logs

With the container running in the background, logs can be accessed by using the `docker logs` command:

```bash
docker logs <container_id>
```

Replace `<container_id>` with the actual ID or name of the running syslog container.


## Custom Configuration (optional)

This image is designed to work without any additional configuration.  However, if you need to customize the configuration, you can do so by creating a custom configuration file and mounting it into the container.

Create a custom rsyslog configuration file (e.g., rsyslog.conf) with your desired settings.  Next run the container with the `-v` option to mount your custom configuration file into the container:

```bash
docker run -it --rm -p 514:514/tcp -p 514:514/udp -v /path/to/custom.conf:/etc/rsyslog.conf:ro mlesniew/syslog
```

Replace `/path/to/custom.conf` with the actual path to your custom configuration file.


## Contributing

If you have any suggestions or find issues with this container image, please feel free to create an issue or submit a pull request.


## License

This project is open-source and available under the GPLv3 License.
