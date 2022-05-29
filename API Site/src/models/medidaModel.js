var database = require("../database/config");

function buscarUltimasMedidas(idDado, limite_linhas) {
    instrucaoSql = `select 
                        temperatura, 
                        umidade,
                        FORMAT(momento,'hh:mm:ss') as momento_grafico
                    from dados_sensor
                    where fkSensor = ${idDado}
                    order by idDado desc limit ${limite_linhas}`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idDado) {
    instrucaoSql = `select 
                        temperatura, 
                        umidade, 
                        FORMAT(momento,'hh:mm:ss') as momento_grafico, 
                        fkSensor 
                        from dados_sensor where fkSensor = ${idDado} 
                    order by idDado desc limit 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}