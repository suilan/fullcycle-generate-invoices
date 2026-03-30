import GenerateInvoices from "../src/GenerateInvoices";

test("Deve gerar notas fiscais", async () => {
    // Atribuir 1 use case por classe
    const generateInvoices = new GenerateInvoices();
    const output = await generateInvoices.execute();
    expect(output).toHaveLength(0);
    
});