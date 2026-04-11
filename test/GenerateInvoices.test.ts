import { parseTwoDigitYear } from "moment";
import GenerateInvoices from "../src/GenerateInvoices";
import e from "express";

// DTO - Data Transfer Object
type Input = {
    month: number;
    year: number;
    type: "cash" | "accrual";
};

test("Deve gerar notas fiscais por regime de caixa", async () => {
    // Atribuir 1 use case por classe
    const generateInvoices = new GenerateInvoices();
    const input: Input = {
        month:1,
        year:2022,
        // type:"accrual" // por competência
        type:"cash" // por caixa
    };

    const output = await generateInvoices.execute(input);

    expect(output[0]?.date).toBe("2022-01-05");
    expect(output[0]?.amount).toBe(6000);

});

test("Deve gerar notas fiscais por regime de competência/serviço - jan", async () => {
    // Atribuir 1 use case por classe
    const generateInvoices = new GenerateInvoices();
    const input: Input = {
        month:1,
        year:2022,
        type:"accrual" // por competência
    };
    const output = await generateInvoices.execute(input);

    expect(output[0]?.date).toBe("2022-01-01");
    expect(output[0]?.amount).toBe(500);

});

test("Deve gerar notas fiscais por regime de competência/serviço - fev", async () => {
    // Atribuir 1 use case por classe
    const generateInvoices = new GenerateInvoices();
    const input: Input = {
        month:2,
        year:2022,
        type:"accrual" // por competência
    };
    const output = await generateInvoices.execute(input);

    expect(output[0]?.date).toBe("2022-02-01");
    expect(output[0]?.amount).toBe(500);

});