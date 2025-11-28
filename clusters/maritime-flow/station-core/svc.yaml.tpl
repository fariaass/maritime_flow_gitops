apiVersion: v1
kind: Service
metadata:
  labels:
    app: {{STYPE}}
    uuid: {{SID}}
  name: s-{{SID}}
  namespace: {{STYPE}}
spec:
  ports:
    - port: 80
      protocol: TCP
      targetPort: 8000
  selector:
    app: {{STYPE}}
    uuid: {{SID}}
  type: ClusterIP
