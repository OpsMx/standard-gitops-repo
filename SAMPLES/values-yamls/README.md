# This folder contains value.yaml templates that can be used as a starting point for installing ISD. Instructions can be found [here](https://docs.google.com/document/d/1D2drat72nj58q-sBjf-HDBX_HuBuBzJQsx4O7BVhWIc/edit?usp=sharing)

**easy-values.yaml**: This is an excellent starting point. It installs an insecure (http) version of ISD and requires no knowledge of site-certificates or DNS.

**basic-values.yaml**: This is a good starting point for a secure (httpS) ISD installation. It will require one of these two:
                  a) cert-manager is installed and the cluster is reachable from the internet
                  b) If you are behind a corporate firewall or need to use your own certifications, we need to manually create site certificates (TLS certs) and install them as TLS secerts, as described HERE
                  
**basic-rbac-saml.yaml**: Same as basic-values.yaml but enable Role Based Access Control (RBAC). This allows for ensure that not everyone can see/modifiy any others' applications

All the above (easy, basic) lavors come with configuration for the built-in openLDAP authentication and authorization.

**saml-rbac-postgres.yaml**: This one provides configuration for integrating with SAML SSO. Instructions can be found here: https://docs.google.com/document/d/1Jo0bUS3L83A9KKbcHaJjJJfyzfw0rDp_mKTxCRwt8QI/edit?usp=sharing
                   This also contains additional configuration for using an external Postgress DB instead of a built-in pod-based DB. Instructions for configuring external DB can be found HERE.

**saml-redis-postgres.yaml**: This is same as saml-rbac-postgres and also includes configuration for using an external Redis such as AWS Elasticache or Google MemoryStore



