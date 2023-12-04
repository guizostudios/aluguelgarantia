# aluguelgarantia
Desafio 1 - Aluguel Garantia


# Contrato Inteligente para Garantia de Aluguel

Este repositório contém contratos inteligentes projetados para facilitar um sistema de garantia de aluguel, destinado especificamente a usuários que desejam alugar uma propriedade, mas não têm um fiador tradicional ou meio alternativo de garantia. O sistema atende a proprietários de imóveis em busca de inquilinos, garantindo automaticamente um valor inicial de garantia. Em caso de não pagamento pelo inquilino, o locador recebe automaticamente o valor da garantia.

## Visão Geral da Proposta

### Usuários-Alvo
- **Inquilinos:** Indivíduos que buscam alugar uma propriedade sem um fiador tradicional.
- **Proprietários:** Donos de propriedades que desejam alugar suas propriedades com uma camada adicional de segurança.

### Objetivos
- Permitir que os inquilinos forneçam uma garantia associada a títulos do Tesouro Direto.
- Definir regras claras em um contrato inteligente, especificando gatilhos para entrada e saída do acordo.
- Permitir que os proprietários solicitem um valor específico de garantia, garantindo a transferência automática em caso de não pagamento pelo inquilino.
- Facilitar o retorno da garantia ao inquilino após a conclusão bem-sucedida do contrato de locação.

## Arquitetura do Contrato Inteligente

### Contrato RentLockFactory
- **Funcionalidades:**
  - Cria instâncias de contratos RentLock.
  - Gerencia transações de depósito e saque.
  - Recupera informações sobre proprietários e inquilinos do contrato.

### Contrato RentLock
- **Funcionalidades:**
  - Gerencia o depósito de segurança e o valor do aluguel.
  - Define a duração e as regras do contrato de locação.
  - Lida com transações de depósito e saque.
  - Facilita o retorno de fundos à parte apropriada com base nas condições do contrato.

## Como Funciona

1. **Inicialização:**
   - O locador cria um contrato RentLock especificando detalhes, como inquilino, taxa, depósito de segurança, valor do aluguel, data de término e dias para pagamento.
   - O inquilino fornece a garantia necessária.

2. **Depósito:**
   - O inquilino deposita fundos no contrato RentLock.
   - O contrato verifica o pagamento do aluguel e atualiza a data e hora em caso de atraso.

3. **Saque:**
   - O locador ou inquilino inicia o saque com base nas condições do contrato.
   - Os fundos são transferidos automaticamente de acordo com as regras especificadas.

4. **Conclusão:**
   - Após a conclusão bem-sucedida do contrato de locação, o inquilino recebe de volta a garantia.
   - Em caso de não pagamento, o locador recebe automaticamente a garantia.

## Diferenciador

Os bancos podem colaborar com o Tesouro Direto para oferecer esse serviço, aproveitando regras claras e automatizadas para maior conveniência do cliente.

## Uso

1. Implante o contrato RentLockFactory.
2. Crie contratos individuais RentLock para acordos de locação específicos.
3. Utilize as funções do RentLockFactory para depósito, saque e recuperação de informações.

