# Docker for xmrig

### Run
```bash
docker run -t -d \
    --restart always \
    --name monero \
    -m 256 \
    playniuniu/xmrig \
    -o pool.minexmr.com:5555 \
    -u wallet_address \
    -p x -k -t 1
```
