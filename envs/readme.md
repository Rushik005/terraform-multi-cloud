Dev vs Stage vs Prod in AWS

| Aspect       | Dev          | Stage          | Prod          |
| ------------ | ------------ | -------------- | ------------- |
| State bucket | tf-state-dev | tf-state-stage | tf-state-prod |
| CIDR         | 10.0.0.0/16  | 10.10.0.0/16   | 10.20.0.0/16  |
| Instance     | t3.micro     | t3.small       | t3.medium+    |
| Tags         | dev          | stage          | prod          |
| Logic        | Same         | Same           | Same          |


Dev vs Stage vs Prod in GCP

| Item         | Dev          | Stage          | Prod          |
| ------------ | ------------ | -------------- | ------------- |
| State bucket | tf-state-dev | tf-state-stage | tf-state-prod |
| CIDR         | 10.10.0.0/24 | 10.20.0.0/24   | 10.30.0.0/24  |
| Machine      | e2-medium    | e2-standard-2  | e2-standard-4 |
| Labels       | dev          | stage          | prod          |
| Logic        | Same         | Same           | Same          |
