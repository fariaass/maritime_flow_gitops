apiVersion: apps/v1
kind: Deployment
metadata:
  name: t-{{TID}}
  namespace: tower
  labels:
    app: tower
    uuid: {{TID}}
spec:
  replicas: 1
  selector:
    matchLabels:
      app: tower
      uuid: {{TID}}
  template:
    metadata:
      labels:
        app: tower
        uuid: {{TID}}
    spec:
      containers:
      - name: tower
        image: fariaass/com-tower:35
        envFrom:
          - secretRef:
              name: credentials
          - secretRef:
              name: email-config
          - configMapRef:
              name: towers-common-config
        env:
          - name: TOWER_ID
            value: {{TID}}
        resources:
          requests:
            memory: "128Mi"
            cpu: "50m"
          limits:
            memory: "256Mi"
            cpu: "200m"
