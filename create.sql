-- Ao criar um migration, o banco de dados é recriado, então é necessário criar o schema e as tabelas novamente
create extension if not exists "uuid-ossp";

drop schema if exists branas cascade;
create schema branas;

-- Contém o Serviço: 
create table branas.contract (
    -- Numero do Serviço
    id_contract uuid not null default uuid_generate_v4() primary key,
    -- Descrição do serviço
    description text,
    -- Valor do serviço
    ammount numeric,
    -- Por quanto tempo o serviço é prestado, em meses
    period integer,
    -- Quando começou a prestação do serviço
    date timestamp
);

-- Pagamento: dependendo do tipo de regime, o pagamento importa
create table branas.payment (
    id_payment uuid not null default uuid_generate_v4() primary key,
    id_contract uuid not null references branas.contract(id_contract),
    -- Valor pago
    amount numeric,
    -- Quando o pagamento foi realizado
    date timestamp
);

insert into branas.contract (id_contract, description, ammount, period, date) 
values ('389e9182-a739-46cf-860e-258bb6602fc6', 'Prestação de serviços escolares', 6000, 12, '2022-01-01T10:00:00');

insert into branas.contract (id_contract, description, ammount, period, date) 
values ('b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 'Prestação de serviços de limpeza', 6000, 12, '2022-01-01T10:00:00');

insert into branas.payment (id_payment, id_contract, amount, date) 
values ('06517b35-e821-4e0c-bf07-174b681c35e0', '389e9182-a739-46cf-860e-258bb6602fc6', 6000, '2022-01-05T10:00:00');

insert into branas.payment (id_payment, id_contract, amount, date) 
values (uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-01-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-02-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-03-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-04-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-05-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-06-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-07-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-08-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-09-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-10-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-11-01T10:00:00'),
(uuid_generate_v4(), 'b3f1c1d0-1a2b-4c3d-8e4f-5a6b7c8d9e0f', 500, '2022-12-01T10:00:00');