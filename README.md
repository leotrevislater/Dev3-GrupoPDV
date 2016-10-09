# Descrição:
Projeto de sistema PDV para a disciplina de Desenvolvimento de Software III.

# Ferramentas Necessárias:
- Git (com o adicional Git Bash), disponível [aqui](https://git-scm.com/downloads).
- JDK7 ou mais recente, disponível [aqui](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html).
- Eclipse Mars, disponível [aqui] (https://eclipse.org/downloads/packages/eclipse-ide-java-ee-developers/mars2).
- MySQL server, disponível [aqui] (https://dev.mysql.com/downloads/mysql/).
- MySQL workbench, disponível [aqui] (https://dev.mysql.com/downloads/workbench/).

# Instruções Para Configuração:
1. Fazer download do Grails.
  - Instalar o Grails com a ferramenta SKDMAN, através do Git Bash, conforme instruções [aqui](https://grails.org/download.html#sdkman).
  - Após, ainda com o Git Bash aberto, executar o comando `sdk install gradle`, e instalar.
  - Na dúvida, também executar o comando `sdk install groovy`, com o Git Bash aberto, para a instalação do Groovy.
  - Adicionar a variável de ambiente GRAILS_HOME, apontando para o local de instalação do Grails (por exemplo `C:\Users\NomeUsuario\.sdkman\candidates\grails\current`).
  - Adicionar o seguinte na variável PATH do Windows: `%GRAILS_HOME%\bin`.
  - Adicionar a variável de ambiente GRADLE_HOME, apontando para o local de instalação do Gradle (por exemplo `C:\Users\NomeUsuario\.sdkman\candidates\gradle\current`).
  - Adicionar o seguinte na variável PATH do Windows: `%GRADLE_HOME%\bin`.
  - Se o Grails foi instalado corretamente, ao abrir um novo terminal e executar `grails -version`, o comando deve ser reconhecido.
2. Configurar o Eclipse para suportar desenvolvimento Grails.
  - Seguir as instruções [aqui](https://tedvinke.wordpress.com/2015/10/17/eclipse-mars-grails-3-1-with-gradle-groovy-and-gsp-support/).
  - Em seguida, instalar o plugin Buildship no Eclipse.

# Mais Informações:
- **Grails**
  - Requisitos, instruções para rodar e *Getting Started* [aqui](http://docs.grails.org/latest/guide/gettingStarted.html#requirements).
  - [GORM (Object Relational Mapping)](http://docs.grails.org/latest/guide/GORM.html)
