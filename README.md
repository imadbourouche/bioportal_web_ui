### Run dev

The first time, run this

```bash 
dip provision 
```


```bash 
dip rails s 
```

### Run test with local API  
```bash 
dip API_URL=http://localhost:9393 test -v
```

### Run test with remote API
> Warning: make sure you run only read tests, and not remove or create data in your remote server
```bash 
dip API_URL=<api_url> test -v
```

