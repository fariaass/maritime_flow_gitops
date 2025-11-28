apiVersion: v1
kind: Service
metadata:
  labels:
    app: tower
    uuid: {{TID}}
  name: t-{{TID}}
  namespace: tower
spec:
  ports:
    - port: 80
      protocol: TCP
      targetPort: 8000
  selector:
    app: tower
    uuid: {{TID}}
  type: ClusterIP
