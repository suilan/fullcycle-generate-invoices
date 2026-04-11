import ContractRepository from "./ContractRepository";
import pgp from "pg-promise";

export default class ContractDatabaseRepository implements ContractRepository {

    // Repositories retornam aggregates, ou seja, objetos completos, com suas dependências.
    async list(): Promise<any> {
        const connection = pgp()("postgres://postgres:postgres@localhost:5432/branas");
        const contracts = await connection.query("select * from branas.contract", []);
         
        for (const contract of contracts) {    
            contract.payments = await connection.query("select * from branas.payment where id_contract = $1", [contract.id_contract]);
        }

        await connection.$pool.end();
        return contracts;
 
    }
}
