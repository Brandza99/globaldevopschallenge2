# Global DevOps Challenge 2

Ovaj projekat je vežba koja spaja Linux, Docker, Docker Compose, Bash, Git i GitHub Actions.

## Šta projekat sadrži

- index.html
- Dockerfile
- docker-compose.yml
- health-check.sh
- GitHub Actions workflow

## Šta sam vežbao

- pravljenje Docker image-a
- pokretanje containera
- mapiranje portova
- Docker Compose sa web i Redis servisom
- Redis named volume
- Bash health-check skriptu
- Git commit i push
- GitHub Actions docker build pipeline

## Testiranje

Lokalni Docker container:

```bash
curl localhost:8170

