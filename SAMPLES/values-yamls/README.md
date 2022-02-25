### Instructions for installing ISD can be found [here](https://docs.google.com/document/d/1D2drat72nj58q-sBjf-HDBX_HuBuBzJQsx4O7BVhWIc/edit?usp=sharing). This folder contains value.yaml templates that can be used as a starting point. 

**easy-values.yaml**: This is an excellent starting point. It installs an insecure (http) version of ISD and requires no knowledge of site-certificates or DNS.

**easy-rbac-values.yaml**: This is a great starting point. It installs an insecure (http) version of ISD along with Role Based Access Control(RBAC) and is generally sufficient for a full POV where RBAC is a requirement. Requires no knowledge of site-certificates or DNS.

**basic-values.yaml**: This is a good starting point for a secure (httpS) ISD installation. It will require one of these two:
1. cert-manager is installed and the cluster is reachable from the internet on port 80
2. Manually create site certificates (TLS certs) and install them as TLS secerts, as described **_HERE_**. If you are behind a corporate firewall or need to use your own certifications, this is the preferred approach. 

**basic-rbac-values.yaml**: Same as basic-values.yaml with Role Based Access Control(RBAC) enabled

All the above (easy, basic) flavors come with configuration for the built-in openLDAP authentication and authorization and are great choices for POV without having to create users and groups or integrating with your organizations SSO. The options below present progressively increasing configurations for production or near-production ISD for a full fledged POV with external DB and SSO integration. 

**base-rbac-noingress**: This one is same as basic-rbac-values but is intended to be used in situations where ingress and certs are being managed outside of the installation process. Note that additional post-installation ISD configuration steps are required.

**basic-rbac-saml.yaml**: Same as basic-values.yaml but enables Role Based Access Control (RBAC). This allows for applications and accounts to be seperated between groups/teams.**DNS is required. If you do not have access to a DNS server, we suggest using the easy-values.yaml**. 

All the above (easy, basic) flavors come with configuration for the built-in openLDAP authentication and authorization and are great choices for POV without having to create users and groups.

**saml-rbac-postgres.yaml**: This one provides configuration for integrating with SAML SSO. Instructions can be found [here](https://docs.google.com/document/d/1Jo0bUS3L83A9KKbcHaJjJJfyzfw0rDp_mKTxCRwt8QI/edit?usp=sharing)
                   This also contains additional configuration for using an **external Postgress** instead of a built-in pod-based DB. Instructions for configuring external DB can be found **_HERE_**.

**saml-redis-postgres.yaml**: This is same as saml-rbac-postgres and also includes configuration for using an **external Redis** such as AWS Elasticache or Google MemoryStore

**only???.yaml**: helm install command accepts multiple values.yaml files at the same time. These files are designed to be modular so that mix-and-match can be used to suite your needs. Please follow the commented instructions in these files.

**default-values.yaml**: This is the FULL values.yaml that is not exepcted to be used. Only for reference to pick-up items that one may need to change.

<!-- Need to link documents for Manually creating TLS secrets and configuring using external DBs -->
