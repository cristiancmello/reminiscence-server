# Reminiscence Server
Um servidor para reconhecimento de dígitos manuscritos.

## Requisitos
- Sistema Operacional Ubuntu 16.04 LTS (Xenial Xerus);
- Caso seja optado pelo uso de GPU, é necessário ter GPU com arquitetura Fermi (2.1) ou superior;
  - Além da GPU, é preciso ter o driver da NVIDIA com versão superior a 340.29 (com binário do nvidia-modprobe).
  
## Instalação do Docker
É preciso instalar o Docker (docker-engine). Execute o comando abaixo num Terminal. Observa-se que após a instalação do Docker, será preciso fazer logoff da sessão de usuário.

```bash
sudo ./docker-install.sh
```

## Instalação do Reminiscence e Execução
A seguir, o comando possibilitará a instalação automática de algumas dependências e inicia o servidor.

```bash
sudo ./install.sh
```