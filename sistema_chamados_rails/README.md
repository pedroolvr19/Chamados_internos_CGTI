# Sistema de Chamados Internos CGTI

Este projeto é um sistema de chamados desenvolvido em Ruby on Rails.

## Pré-requisitos

Certifique-se de ter instalado:
* Ruby 3.4.5
* Node.js e Yarn
* SQLite3

## Como Instalar e Rodar (Rápido)

O projeto possui um script de configuração automatizado que instala dependências, prepara o banco de dados e inicia o servidor.

No terminal, execute:

```bash
bin/setup
```

Isso fará tudo automaticamente. O sistema estará acessível em `http://localhost:3000`.

## Como Instalar e Rodar (Manual)

Caso prefira rodar passo a passo:

1. **Instale as dependências:**
   ```bash
   bundle install
   yarn install
   ```

2. **Prepare o banco de dados:**
   ```bash
   bin/rails db:prepare
   ```

3. **Inicie o servidor:**
   Execute o comando abaixo para rodar o Rails e o processo de CSS (Tailwind/Build) simultaneamente:
   ```bash
   bin/dev
   ```

## Docker

Para construir e rodar a imagem Docker (foco em produção):

```bash
docker build -t sistema_chamados_rails .
docker run -d -p 80:80 --name sistema_chamados sistema_chamados_rails
```
