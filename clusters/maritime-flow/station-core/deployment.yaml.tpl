apiVersion: apps/v1
kind: Deployment
metadata:
  name: s-SID
  namespace: STYPE
  labels:
    app: STYPE
    uuid: SID
spec:
  replicas: 1
  selector:
    matchLabels:
      app: STYPE
      uuid: SID
  template:
    metadata:
      labels:
        app: STYPE
        uuid: SID
    spec:
      containers:
      - name: STYPE
        image: fariaass/station-core 
        env:
          - name: DOCKS_QTT
            value: "1"
          - name: HELIPADS_QTT
            value: "1"
        resources:
          requests:
            memory: "128Mi"
            cpu: "50m"
          limits:
            memory: "256Mi"
            cpu: "200m"
