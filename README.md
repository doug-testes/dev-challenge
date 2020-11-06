# Nexoos Challenge

A Nexoos é uma plataforma online sem burocracia e sem taxas abusivas que conecta empresas
que necessitam de empréstimos a investidores pessoa Física tornando este processo mais rápido, eficiente e justo no modelo marketplace lending.

## Desafio

Cenário: Na Nexoos, um empréstimo de R$ 100.000,00 pode ser financiado por até 200 pessoas e cada um recebe uma fatia proporcional das parcelas pagas.

Simulando uma taxa de 1.5% a.m. em 12x, teríamos 12 parcelas de R$ 9.168,00.

O valor da parcela é calculado usando a fórmula `pmt`:

```
pmt = valor_presente * ((((1 + taxa) ** numero_de_periodos) * taxa) / (((1 + taxa) ** numero_de_periodos) - 1))
```

Exemplo:

```
100000 * ((((1.015) ** 12) * 0.015) / (((1.015) ** 12) - 1)) = 9167.999290622945
```

Construa uma aplicação web, utilizando a linguagem e frameworks de sua preferência, que seja capaz de:
- Cadastrar um solicitante(razão social, cnpj, endereço(s) e telefone(s));
- Criar uma solicitação de crédito(valor);
- Pedir um empréstimo informando valor, prazo e taxa de juros.
- Gerar automaticamente as respectivas parcelas com intervalos regulares de um mês entre os vencimentos. 

## Requisitos:

- O código no repositório público do GitHub;
- Utilizar Postgres, MySQL ou o banco de dados de sua preferência ;
- Testes unitários.
- Inglês técnico(desejável);

Ao finalizar, faça um Pull Request neste repositório e avise-nos por email.



# Sobre o app construído: Nexx

A Nexx é uma plataforma online sem burocracia e sem taxas abusivas que possibilita empresas obterem um emprestimo.
Você pode fazer sua solitiação agora mesmo pelo site: https://nexx-app.herokuapp.com

## ERD
![alt ERD](https://i.imgur.com/FIYJtFZ.png "ERD")

## Escolhas técnicas

Ruby: 2.5.7
Rails: 6.0.3.4
Banco de dados: Postgres 11.6
Testes: RSpec
API para CEP: viacep.com.br
Layout: Stisla https://github.com/stisla/stisla

## Ambiente de desenvolvimento

Execute os comandos abaixo para iniciar seu ambiente de desenvolvimento utilizando o Docker Compose na porta 3001

1. `git clone https://github.com/doug-testes/dev-challenge.git`
1. `cd dev-challenge/dev-env`
1. `cp rails_app/.env.sample rails_app/.env`
1. `docker-compose build`
1. `docker-compose run app rails db:make`
1. `docker-compose up`

Acesse a url: http://localhost:3001/

## Rodar cobertura de testes
Com o ambiente de desenvolvimento preparado basta rodar:

```docker-compose run app rspec```

## Melhorias

[ ] API de autcomplet para os CNPJ -> Receitaws
[ ] Autenticação e segurança
[ ] Melhorias no mobile