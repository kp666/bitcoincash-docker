# bitcoincash-docker
Docker Repo for [BitcoinCash](https://www.bitcoincash.org/).

## Usage Instructions

**Mandatory Requirement**: Must use a local mount volume and config file.

Example:

```
sudo docker run -it --name=bitcoincash-docker \   
-v /path/to/local/bitcoincash/dir:/opt/bitcoinabc \   
-p 127.0.0.1:18332:18332 kp666/bitcoincash-docker:latest
```

**Config file is read from**: `/opt/bitcoinabc/bitcoind.conf`, i.e., `/path/to/local/bitcoincash/dir/bitcoind.conf`

##Storing of Data

You can store data within `/opt/bitcoinabc/data` or any directory within `/opt/bitcoinabc`.

This will inturn store your data within `/path/to/local/bitcoincash/dir` described above. 

Hence, to store within a different local dir, create a hard symlink for any other directory inside `/path/to/local/bitcoincash/dir` and then use that directory as `datadir` in `bitcoind.conf`

###Example

If your host directory is `/usr/local/bitcoincash` and want to store data in `/var/bitcoincash`, do the following:

```
mkdir -p /usr/local/bitcoincash
mkdir -p /var/bitcoincash
ln -s /var/bitcoincash /usr/local/bitcoincash/data
```

and use `/opt/bitcoinabc/data` as your data dir inside the `bitcoind.conf`

```
#bitcoind.conf
datadir=/opt/bitcoinabc/data
```

##Based on:
https://github.com/sreekanthgs/bitcoin-docker
