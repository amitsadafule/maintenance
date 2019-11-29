# maintenance
This project allows you to create a docker image for creating a `maintenance-service`. You can deploy this in any orchestration tool and with few tweeks to your deployment stage you can provide user a `under maintenance` response.

This repository has `default.conf` file. This file has nginx related configuration.
It has following configuration (you can change it as per your need)
- If request's content type is `application/json`, then return following json response
```
{"code":"503", "message": "Under Maintenance"}
```
-    Else return html (`maintenance.html` file in repository)

### Helm changes
Following changes are required in helm deployment stage if you want to deploy the service along with putting it under maintenance mode
- deploy `maintenance` image in kubernentes (using helm)
Whenever you want to put a service (say service `A`) to maintenance mode, do following changes to `service.yaml` of service `A`
- change `spec.selector.app` key to point to `maintenance`
- change `spec.ports[].targetPort` to `80` (our `maintenance` listens on port 80)
- Trigger `helm upgrade` for the service `A`. This will redirect all requests coming for service `A` to `maintenance` deployment
- revert above changes when you want to take your service out of maintenance mode

All above steps can be automated in ci/cd. Above strategy can also be used to put service `A` under maintenance while deployment

#### Go ahead, fork this project and change `maintenance.html` as per your project's UI
