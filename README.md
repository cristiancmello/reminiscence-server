# Reminiscence Server
Um servidor como ambiente de software para aplicações de Machine Learning.

## Requisitos
- Sistema Operacional Ubuntu 16.04 LTS (Xenial Xerus);
- Caso seja optado pelo uso de GPU, é necessário ter GPU com arquitetura Fermi (2.1) ou superior;
  - Além da GPU, é preciso ter o driver da NVIDIA com versão superior a 340.29 (com binário do nvidia-modprobe).
  
## Download do projeto
Dê um git clone no projeto e entre no diretório clonado.

```bash
$ git clone https://github.com/cristiancmello/reminiscence-server.git
$ cd reminiscence-server
```
  
## Instalação do Docker
É preciso instalar o Docker (docker-engine). Observa-se que após a instalação do Docker, será preciso fazer logoff da sessão de usuário (não esqueça de salvar suas informações antes de confirmar o logoff).

```bash
sudo ./docker-install.sh
```

## Instalação do Reminiscence e Execução
A seguir, o comando possibilitará a instalação automática de algumas dependências e inicia o servidor.

```bash
sudo ./rem --cpu # Instala ou Inicia o servidor com suporte somente para CPU.
```

```bash
sudo ./rem --gpu # Instala ou Inicia o servidor com suporte a GPU NVIDIA.
```

Após a primeira instalação ou inicialização, não é mais preciso utilizar privilégio de superuser para executar o Reminiscence.

## Encerramento da Execução do Reminiscence
Para encerrar o servidor do Reminiscence, você pode pressionar `<CTRL+C>` no terminal onde o script de inicialização foi executado.
