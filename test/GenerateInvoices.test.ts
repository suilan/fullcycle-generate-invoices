import { parseTwoDigitYear } from "moment";
import GenerateInvoices from "../src/GenerateInvoices";
import e from "express";

test("Deve gerar notas fiscais", async () => {
    // Atribuir 1 use case por classe
    const generateInvoices = new GenerateInvoices();
    const input = {
        month:1,
        year:2022,
        // type:"accrual" // por competência
        type:"cash" // por caixa
    };

    const output = await generateInvoices.execute(input);
    
    expect(output[0]?.date).toBe("2022-01-05");
    expect(output[0]?.amount).toBe(6000);

});