# CSVM Calling Conventions

A test area for new CSVM calling conventions.

# Project Status

Not stable, not finalized, not ready for use of any kind. Final working specification tbd.

This project will serve as a [Walking Skeleton](http://wiki.c2.com/?WalkingSkeleton) for the next version of the CSVM and Farmware ecosystem.

The final version will almost certainly be authored in a different language.

# Creating a Client

```ruby
client = CSVM::Client.new()
client.connect # Begin handshake
```

# Simple RPCs

For simple RPC requests, use `send_rpc`.

```ruby
cmd1 = { kind: "wait", args: { milliseconds: 500 } }
cmd2 = { kind: "wait", args: { milliseconds: 250 } }

# Provide 1+ celery nodes:
client.send_rpc(cmd1, cmd2)
```

Examples of simple RPCs:

# Blob-Based Operations

## Photo Uploads

```ruby
# Blocking operation.
# Returns void. Crashes on failure.
client.upload_photo(my_jpg_blob)
```

## Download State Tree

```ruby
# Blocking operation.
# Returns void. Crashes on failure.
state = client.read_status
```

## Resource CRUD

Perform CRUD actions by using the naming convention provided by the API.

Details TBD.

# Scratchpad


| Operation                   | Uploads blobs?   | Downloads blobs? | Uploads CS?      |
|-----------------------------|------------------|------------------|------------------|
|Create Resource              |:heavy_check_mark:|:heavy_check_mark:|:question:        |
|Read Resource                |:question:        |:heavy_check_mark:|:question:        |
|List Resources               |:question:        |:heavy_check_mark:|:question:        |
|Update Resource              |:question:        |:heavy_check_mark:|:question:        |
|Destroy Resource             |:question:        |:question:        |:question:        |
|Photo creation               |:heavy_check_mark:|:question:        |:question:        |
|change_ownership             |:question:        |:question:        |:question:        |
|check_updates                |:question:        |:question:        |:question:        |
|dump_info                    |:question:        |:question:        |:question:        |
|register_gpio                |:question:        |:question:        |:question:        |
|sync                         |:question:        |:question:        |:question:        |
|unregister_gpio              |:question:        |:question:        |:question:        |
|read_status                  |:question:        |:question:        |:question:        |
|calibrate                    |:x:               |:x:               |:heavy_check_mark:|
|config_update                |:x:               |:x:               |:heavy_check_mark:|
|emergency_lock               |:x:               |:x:               |:heavy_check_mark:|
|emergency_unlock             |:x:               |:x:               |:heavy_check_mark:|
|execute                      |:x:               |:x:               |:heavy_check_mark:|
|execute_script               |:x:               |:x:               |:heavy_check_mark:|
|factory_reset                |:x:               |:x:               |:heavy_check_mark:|
|find_home                    |:x:               |:x:               |:heavy_check_mark:|
|home                         |:x:               |:x:               |:heavy_check_mark:|
|install_farmware             |:x:               |:x:               |:heavy_check_mark:|
|install_first_party_farmware |:x:               |:x:               |:heavy_check_mark:|
|move_absolute                |:x:               |:x:               |:heavy_check_mark:|
|move_relative                |:x:               |:x:               |:heavy_check_mark:|
|power_off                    |:x:               |:x:               |:heavy_check_mark:|
|read_pin                     |:x:               |:x:               |:heavy_check_mark:|
|reboot                       |:x:               |:x:               |:heavy_check_mark:|
|remove_farmware              |:x:               |:x:               |:heavy_check_mark:|
|send_message                 |:x:               |:x:               |:heavy_check_mark:|
|set_servo_angle              |:x:               |:x:               |:heavy_check_mark:|
|set_user_env                 |:x:               |:x:               |:heavy_check_mark:|
|take_photo                   |:x:               |:x:               |:heavy_check_mark:|
|toggle_pin                   |:x:               |:x:               |:heavy_check_mark:|
|update_farmware              |:x:               |:x:               |:heavy_check_mark:|
|wait                         |:x:               |:x:               |:heavy_check_mark:|
|write_pin                    |:x:               |:x:               |:heavy_check_mark:|
|zero                         |:x:               |:x:               |:heavy_check_mark:|
