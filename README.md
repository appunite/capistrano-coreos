# Capistrano::CoreOS
Managing CoreOS machines and Docker containers by Capistrano 3

NOTE: this is **work in progress**

prototyping now

## INSTALLATION
Add this line to your application's Gemfile:

```ruby
gem "capistrano-coreos", github: "spesnova/capistrano-coreos"
```

And then execute:

```bash
$ bundle
```

Require coreos tasks.

```ruby
# Capfile
require "capistrano/coreos"
```

## USAGE (blueprint)
### CoreOS

```bash
# List machines
$ cap prod coreos:machines
MACHINE        SYSTEMD    VERSION   CHANNEL   STRATEGY
172.17.8.101   running    522.6.0   stable    off
172.17.8.103   running    522.6.0   stable    off
172.17.8.102   running    522.6.0   stable    off

# Switch channel
$ cap prod coreos:switch:channel channel=alpha
Switching core-01's channel to alpha... done
Switching core-02's channel to alpha... done
Switching core-03's channel to alpha... done

# Switch strategy
$ cap prod coreos:switch:strategy strategy=best-effort
Switching core-01's strategy to best-effort... done
Switching core-02's strategy to best-effort... done
Switching core-03's strategy to best-effort... done

# Download update
$ cap prod coreos:update
Updating core-01 to 522.6.0... done
Updating core-02 to 522.6.0... done
Updating core-03 to 522.6.0...

# Reboot
$ cap prod coreos:reboot
Rebooting core-01...
```

### docker

```bash
```

### systemd

```bash
# Show systemd status summary
$ cap prod systemd:status
MACHINE        STATE      JOBS       FAILED
172.17.8.101   running    0 queued   0 units
172.17.8.103   running    0 queued   0 units
172.17.8.102   running    0 queued   0 units

# List systemd units
$ cap prod systemd:units

# List systemd sockets
$ cap prod systemd:sockets

# List systemd timers
$ cap prod systemd:timers

# Reload systemd
$ cap prod systemd:daemon_reload

# Start/Stop/Reload/Restart unit
$ cap prod systemd:start[<UNIT>]
$ cap prod systemd:stop[<UNIT>]
$ cap prod systemd:reload[<UNIT>]
$ cap prod systemd:restart[<UNIT>]
```

### fleet

```bash
# Show fleet status
$ cap prod fleet

# List units
$ cap prod fleet:units
UNIT          MACHINE                  ACTIVE   SUB
hello.service 113f16a7.../172.17.8.103 inactive dead

# Add unit
$ cap prod fleet:submit[<UNIT>]
Submitting <UNIT>... done

# Remove unit
$ cap prod fleet:destroy[<UNIT>]
Destroying <UNIT>... done

# Start/Stop unit
$ cap prod fleet:start[<UNIT>]
$ cap prod fleet:stop[<UNIT>]

# Schedele/Unschedule unit
$ cap prod fleet:load[<UNIT>]
$ cap prod fleet:unload[<UNIT>]

# Output a unitfile content
$ cap prod fleet:cat[<UNIT>]

# Output journal of a unit
$ cap prod fleet:journal[<UNIT>]
```

### etcd

```bash
# Show etcd status
$ cap prod etcd

# Get etcd key-value
$ cap prod etcd:get key=<KEY>

# Set etcd key-value
$ cap prod etcd:set key=<KEY> value=<VALUE>

# List etcd key
$ cap prod etcd:ls key=<KEY>
$ cap prod etcd:ls:recursive key=<KEY>

# Make/Remove a key
$ cap prod etcd:mk key=<KEY>
$ cap prod etcd:rm key=<KEY>

# Make/Remove a directory
$ cap prod etcd:mkdir key=<KEY>
$ cap prod etcd:rmdir key=<KEY>
```

### flannel

```bash
# Show flannel status
$ cap prod flannel
```

### locksmith

```bash
# Show status of the cluster wide reboot lock
$ cap prod locksmith:status
```

## LICENSE
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
