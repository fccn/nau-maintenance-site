# Maintenance NAU site
This repository has the maintenance site of [NAU](https://nau.edu.pt).

This page is shown if there is an application error.

This page is hosted on Ceph S3 Bucket that the applications use when they need to show an error to the user.

Because the maintenance page is something different and out of scope of the applications (Open edX and NAU Richie) that make up [NAU](https://nau.edu.pt), then this repository was created.

## Update site

Simply run the `deploy.sh` file, that updates the maintenance page for all environments.
```bash
AWS_ACCESS_KEY_ID=XXXX AWS_SECRET_ACCESS_KEY=YYYY deploy.sh
```

Or alternatively, for each environment (DEV, STAGE and PROD), replace the access key and secret and the correct bucket name, and run:
```
AWS_ACCESS_KEY_ID=XXXX AWS_SECRET_ACCESS_KEY=YYYY s3cmd --host rgw.nau.fccn.pt --host-bucket nau-dev-shared put maintenance-site/index.html "s3://nau-dev-shared/maintenance-site/index.html" --acl-public
```

After a push to master branch the Github Action will update automatically the maintenance page on each environment.

## Verify site
To check the current maintenance page open:

| Environment | Proxy Link | Bucket Link | 
| ----------- | ---------- | ------------------ |
| DEV         |  https://shared.static.dev.nau.fccn.pt/maintenance-site/index.html | https://rgw.nau.fccn.pt/nau-dev-shared/maintenance-site/index.html |
| STAGE       |  https://shared.static.stage.nau.fccn.pt/maintenance-site/index.html | https://rgw.nau.fccn.pt/nau-stage-shared/maintenance-site/index.html |
| PROD        |  https://shared.static.prod.nau.fccn.pt/maintenance-site/index.html | https://rgw.nau.fccn.pt/nau-prod-shared/maintenance-site/index.html |


## Kubernetes

The Kubernetes deployment uses a copy of this maintenance page, instead of using the live version from Ceph S3.
