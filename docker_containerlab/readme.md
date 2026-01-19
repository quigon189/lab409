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

### 1.2. Устанавливаем разрешения на доступ
```bash
sudo sed -i 's/^SigLevel.*/SigLevel = Optional TrustAll/g' /etc/pacman.conf
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

### 4.1. Установка
```bash
bash -c "$(curl -sL https://get-clab.srlinux.dev)"
```

### 4.1. Альтерантивный способ
```bash
curl -L https://github.com/srl-labs/containerlab/releases/download/v0.72.0/containerlab_0.72.0_linux_amd64.tar.gz -o clab.tar.gz

tar -xzf clab.tar.gz

sudo mv containerlab /usr/bin/

echo "alias clab='containerlab'" >> ~/.zshrc && source ~/.zshrc
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
wget https://github.com/siemens/edgeshark/raw/main/deployments/wget/docker-compose.yaml
```

### 6.3. Дабавление алиасов на запуск EdgeShark
```bash
echo "alias edgeshark-up='docker-compose -f ~/edgeshark/docker-compose.yaml up -d'" >> ~/.zshrc && source ~/.zshrc
echo "alias edgeshark-down='docker-compose -f ~/edgeshark/docker-compose.yaml down'" >> ~/.zshrc && source ~/.zshrc
```

### 6.5. Запуск EdgeShark
```bash
edgeshark-up

# После обязательно выключить контейнеры что бы освободить ресурсы
edgeshark-down
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
