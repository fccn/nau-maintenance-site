# Maintenance NAU site
This repository has the maintenance site.

The html, css and images are copied to a ceph bucket an showned to client if there is some error on NAU applications.

## Before deploy
Because the site don't is a fat html, it has imported css and images, and because those could be on a different location where the index.html is rendered.
So we have to update those location.

## Update site with absolute URLs
```
./update-site-url.sh https://shared.static.dev.nau.fccn.pt/maintenance-site/
```

## Update site for environment

#### remove existing site

```
AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXX AWS_SECRET_ACCESS_KEY=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY s3cmd --host 10.0.12.62 --host-bucket nau-dev-shared --no-ssl rm "s3://nau-dev-shared/maintenance-site" --recursive

```

#### put site
```
AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXX AWS_SECRET_ACCESS_KEY=YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY s3cmd --host 10.0.12.62 --host-bucket nau-dev-shared --no-ssl put target/* "s3://nau-dev-shared/maintenance-site/" --recursive --acl-public --no-mime-magic 
```

#### Verify site
To check if it was putted ok use:
https://shared.static.dev.nau.fccn.pt/maintenance-site/index.html

### Stage environment
For stage environment use previous commands but replace 'dev' keyword with 'stage'.

### Prod environment
For stage environment use previous commands but replace 'dev' keyword with 'prod'.
