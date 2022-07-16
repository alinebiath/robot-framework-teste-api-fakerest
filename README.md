# Testes automatizados com Robot Framework para API "FakeRestAPI.Web"

- Testes aplicados na API FakeRestAPI, disponível em: https://fakerestapi.azurewebsites.net/index.html
- Alguns testes básicos para os seguintes métodos HTTP: GET, POST, PUT and DELETE
- A API não requer autentiação

### 1. Estrutura de arquivos e diretórios
Os testes estão estruturados nos seguintes diretórios:

- **keywords**: diretório que contém arquivos <i>.robot</i> com a implementação das palavras-chaves (keywords).
- **other_files**: diretório que contém arquivos <i>.json</i> criados para passar os dados do body nos testes com PUT e POST.
- **test-suites**: diretório que contém arquivos .robot com as suítes de testes (cenários ou casos de testes).
- **requirements.txt**: arquivo que contém as chamadas para instalação das libraries do robot que são necessárias para executar os testes.</br>

### 2. Pré condições para os testes
- Clonar esse projeto
- Python 2.7.x ou superior
- Usar um editor ASCII de sua preferência (VSCode, Atom, RIDE, etc)</br>

### 3. Instalando libraries Python necessárias
Instale todas a libraries Python necessárias, digitando no terminal o comando:

```sh
Linux / Mac
$ pip install -r requirements.txt --user
```

### 4. Executando os testes de aceitação
> Os comandos abaixo devem ser executados no terminal, no diretório raiz do projeto.

- Para executar somente os cenários de consulta (GET): 
```sh
$ python -m robot -d output/consults test-suites/consult-data.robot
```
- Para executar somente os cenários de manipulação de dados (PUT, POST and DELETE):
```sh
$ python -m robot -d output/manipultation test-suites/manipulation-data.robot
```
<i>NOTE: Para os testes com métodos PUT e POST, foram criados dois arquivos <i>.json</i> para passar os dados do body. Eles podem ser alterados conforme necessidade.</i></br></br>

### 5. Gerando documentação adicional

Gerando docuentação para as palavras-chaves do usuário (common.robot):

```sh
$ python -m robot.libdoc keywords/faker-api.robot doc/faker-api.html
```
Gerando documentação para os casos de testes existentes:

```sh
$ python -m robot.testdoc test-suites/ doc/test-suites.html
```
