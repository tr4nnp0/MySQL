-- Consulta ao banco de dados do SENAC, solicitada como atividade de avaliação na disciplina de projeto integrador,
-- com o objetivo de gerar o saldo do usuário em senac coins, moedas obtidas através da entrega de tarefas que podem
-- ser trocadas por produtos e serviços.

SELECT senac_coin.senac_coin_id, senac_coin_movimentacao.senac_coin_movimentacao_data,
senac_coin.senac_coin_saldo + senac_coin_movimentacao.senac_coin_movimentacao_valor AS saldo_senac_coin
FROM bdacompanhamento.senac_coin, bdacompanhamento.senac_coin_movimentacao
WHERE senac_coin.senac_coin_id = 1;
