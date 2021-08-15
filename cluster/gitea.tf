resource "kubectl_manifest" "gitea-application" {
  yaml_body = <<YAML
    apiVersion: argoproj.io/v1alpha1
    kind: Application
    metadata:
      name: gitea
      namespace: argocd
      finalizers:
        - resources-finalizer.argocd.argoproj.io
    spec:
      destination:
        name: in-cluster
        namespace: gitea
        server: ''
      source:
        path: ''
        repoURL: 'https://dl.gitea.io/charts/'
        targetRevision: 2.2.5
        chart: gitea
        helm:
          values: |
            ingress:
              enabled: true
              certManager: true
              annotations:
                cert-manager.io/cluster-issuer: letsencrypt-clusterissuer
              hosts:
              - gitea.${var.domain}
              tls:
              - hosts:
                - gitea.${var.domain}
                secretName: gitea.tls
      project: default
      syncPolicy:
        automated:
          prune: true
          selfHeal: true
        syncOptions:
          - CreateNamespace=true
    YAML
  )
}
