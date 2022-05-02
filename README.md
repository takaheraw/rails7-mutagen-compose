# rails7-mutagen-compose

## Initial setup

```
% mutagen-compose up -d
% mutagen-compose exec app bash
root@c682ba9bdbb2:/app# bundle install
root@c682ba9bdbb2:/app# bundle exec rails db:create
root@c682ba9bdbb2:/app# bundle exec rails s -b 0.0.0.0
```
