  - name: ${acname}
    requiredGroupMembership: []
    providerVersion: V2
    permissions: {}
    dockerRegistries: []
    configureImagePullSecrets: true
    cacheThreads: 1
    namespaces: []
    omitNamespaces: []
    kinds: []
    omitKinds: []
    customResources: []
    cachingPolicies: []
    kubeconfigFile: configserver:kubecfgsDir/k8s_${acname}.cfg
    liveManifestCalls: true
    oAuthScopes: []
    onlySpinnakerManaged: true
