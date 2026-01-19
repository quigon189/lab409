# Инструкция по установке Docker, Docker Compose, ContainerLab и Wireshark на Manjaro Linux

## 1. Предварительные требования

### 1.1. Обновление системы
```bash
sudo pacman -Syu
```

### 1.2. Установка необходимых зависимостей
```bash
sudo pacman -S base-devel git curl wget
```

## 2. Установка Docker

### 2.1. Установка Docker
```bash
sudo pacman -S docker
```

### 2.2. Запуск и добавление в автозагрузку
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

### 2.3. Добавление пользователя в группу docker
```bash
sudo usermod -aG docker $USER
newgrp docker
```

### 2.4. Проверка установки
```bash
docker --version
```

## 3. Установка Docker Compose

### 3.1. Установка через pacman
```bash
sudo pacman -S docker-compose
```

### 3.2. Проверка установки
```bash
docker-compose --version
```

## 4. Установка ContainerLab

### 4.1. Установка через pacman
```bash
sudo pacman -S containerlab
```

### 4.2. Проверка установки
```bash
containerlab version
```

## 5. Установка Wireshark

### 5.1. Установка Wireshark
```bash
sudo pacman -S wireshark-qt
```

### 5.2. Добавление пользователя в группу wireshark
```bash
sudo usermod -aG wireshark $USER
```

## 6. Скачивание и настройка EdgeShark

### 6.1. Создание рабочей директории
```bash
mkdir ~/edgeshark && cd ~/edgeshark
```

### 6.2. Скачивание docker-compose файла для EdgeShark
```bash
# Вариант 1: Если известен прямой URL
wget https://raw.githubusercontent.com/srl-labs/edgeshark/main/docker-compose.yml

# Вариант 2: Клонирование репозитория (если доступен)
git clone https://github.com/srl-labs/edgeshark.git
cd edgeshark
```

### 6.3. Если файл docker-compose.yml не найден, создайте его вручную:
```bash
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  edgeshark:
    image: ghcr.io/srl-labs/edgeshark:latest
    container_name: edgeshark
    restart: unless-stopped
    network_mode: "host"
    privileged: true
    environment:
      - DISPLAY=${DISPLAY}
      - XAUTHORITY=/tmp/.docker.xauth
    volumes:
      - /tmp/.X11-unix:/tmp/.X11-unix:rw
      - /tmp/.docker.xauth:/tmp/.docker.xauth:rw
      - ${XAUTHORITY}:/tmp/.docker.xauth:ro
      - ./captures:/home/wireshark/captures
      - ./config:/home/wireshark/.config/wireshark
    command: wireshark
EOF
```

### 6.5. Запуск EdgeShark
```bash
# Сначала попробуйте запустить с правами суперпользователя
sudo docker-compose up -d
```

## 7. Проверка работоспособности

### 7.1. Проверка Docker
```bash
docker run hello-world
```

### 7.2. Проверка ContainerLab
```bash
containerlab inspect --version
```

## 10. Полезные команды

```bash
# Остановить все контейнеры
docker stop $(docker ps -aq)

# Удалить все контейнеры
docker rm $(docker ps -aq)

# Просмотр логов EdgeShark
docker-compose logs -f edgeshark

# Обновить EdgeShark до последней версии
docker-compose pull
docker-compose up -d
```
