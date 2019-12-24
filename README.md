# flutter_base_structure

Esse repositório é um exemplo de base de estrutura de arquivos e diretórios para manter a organização de um projeto em flutter.

## Getting Started

### Pages

**Pages**: podemos tratar como _pages_ aquilo que entendemos como um fluxo completo. Por exemplo: tela de login, tela de cadastro.

Cada _Page_ deve ser colocada dentro de um diretório.
A nomenclatura de uma _Page_ deve conter o sufixo `_page`. Ex: `home_page.dart`, `login_page.dart`.

```
lib
|-- pages
  |-- ...
  |-- home
    |-- home_page.dart
```

### Widgets

**Widgets**: podemos tratar como _widgets_ componentes que compõem a _Page_.

Os _widgets_ específicos de uma _Page_, devem estar no diretório _widgets_ dentro do diretório da _Page_:

```
lib
|-- pages
  |-- ...
  |-- home
    |-- ...
    |-- widgets
      |-- contact_tile
        |-- contact_tile_widget.dart
        |-- ...
```

Os **_widgets_ globais** devem ser criados em `shared/widgets`.

### Models

**Models**: são os modelos, ou seja, a representção dos dados.

Os _Models_ da aplicação devem estar em `shared/models` e cada entidade deve conter o sufixo `_model`.

_Models_ específicos de uma _Page_, que não serão compartilhados entre outras _Pages_ da aplicação, podem estar dentro do diretório da _Page_. Ex: `login_model.dart` que contém os dados do login e senha do usuário para submeter ao serviço de login.

### Repository

**Repository**: responsável por resgatar e persistir os dados, sendo eles vindo de uma API, _socket_, ou até mesmo banco de dados local.

O _repository_ relacionado a uma _Page_, deve estar no diretório da _Page_:

```
lib
|-- pages
  |-- ...
  |-- home
    |-- home_repository.dart
    |-- ...
```

### Camada de lógica

Camada de lógica: pode ser qualquer arquitetura (BLoC, MobX, Redux), contanto que esteja com o padrão de nomenclatura correta. Ex:

```
lib
|-- pages
  |-- home
    |-- home_bloc.dart
    |-- ...
```

### shared

No _shared_ deve conter todo código compartilhado na aplicação: _models_, Camadas de lógica, _services_, _utils_ etc. Ex: autenticação, usado em mais de uma _Page_ para verificar se o usuário está logado.

## Patterns

Sample of code using follow patterns (see `AuthBloc` usage):

- [Singleton](https://github.com/abraaolevi/flutter_base_structure/tree/singleton)
- [Injector](https://github.com/abraaolevi/flutter_base_structure/tree/injector)
- [BlocProvider](https://github.com/abraaolevi/flutter_base_structure/tree/bloc_pattern), BLoC's inside _BlocProvider_ should extends from _BlocBase_ and must have override `dispose` method to dispose automatically when provide is closed.
- [Modules](https://github.com/abraaolevi/flutter_base_structure/tree/modules), each page is considered a module. `AppModule` is responsable to matain all globall instances.