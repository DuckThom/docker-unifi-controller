# docker-unifi-controller
Docker container to run the Unifi controller

## Persistent storage

- `/var/lib/unifi`: Contains the data folders used by Unifi and MongoDB (required)
- `/var/log/unifi`: Contains the log files

## Ports

- `3478/udp`: STUN (required)
- `8080/tcp`: Device and controller communication (required)
- `8443/tcp`: HTTPS Gui/API (required)
- `8880/tcp`: HTTP Portal redirection
- `8843/tcp`: HTTPS Portal redirection
- `6789/tcp`: Unifi mobile speed test
