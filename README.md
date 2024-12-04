# Juliet-Portfolio

Made in Next.Js, Tailwind.css and GSAP

This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

## Some changes for deployment on a Minikube instance

I am mentioning these steps

if you already have a minikube instance running, which is not working or have been configured incorrectly. It will be better for you to start over

- `minikube stop`
- `minikube delete`

#### startover

- `minikube start`
- `eval $(minikube docker-env)`
- `docker build -t <app-name>:latest` or in our case `docker build -t juliet:latest`
- `kubectl apply -f deployment.yaml`
- `kubectl apply -f service.yaml`
- `docker images`

\ This should reflect our image, `juliet:latest`

- kubectl get pods
- kubectl expose deployment juliet --type=NodePort --port=8080
- minikube service juliet

## Troubleshooting

### Pod Error

check logs

- `kubectl get pods`
- `kubectl logs <pod-name>`
- `kubectl describe pod <pod-name>`

Make sure that your app is in production mode.<br>
If Alles Kaputt

`delete and reapply deployment.yaml and service.yaml`

Also make sure target port in `service.yaml` is same as container port in `deployment.yaml` and `dockerfile`
