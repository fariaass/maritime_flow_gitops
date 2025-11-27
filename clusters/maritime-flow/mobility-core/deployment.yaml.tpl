apiVersion: apps/v1
kind: Deployment
metadata:
  name: v-VID
  namespace: VTYPE
  labels:
    app: VTYPE
    uuid: VID
spec:
  replicas: 1
  selector:
    matchLabels:
      app: VTYPE
      uuid: VID
  template:
    metadata:
      labels:
        app: VTYPE
        uuid: VID
    spec:
      containers:
      - name: VTYPE
        image: fariaass/mobility-core:8
        args:
          - "VID"
          - "VTYPE"
          - "LATITUDE"
          - "LONGITUDE"
          - "VELOCITY"
          - "towers-svc.tower.svc.cluster.local"
        envFrom:
          - secretRef:
              name: rabbitmq-credentials
          - configMapRef:
              name: vehicles-common-config
        resources:
          requests:
            memory: "128Mi"
            cpu: "50m"
          limits:
            memory: "512Mi"
            cpu: "500m"
