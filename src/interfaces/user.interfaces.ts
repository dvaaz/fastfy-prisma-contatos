export interface User {
    id: string;
    name: string;
    email: string;
}
// Interface para criar um novo usuario
interface UserCreate {
    name: string;
    email: string;
}

// Interface para o repositório de usuários
export interface UserRepository {
    // método(variáveis: tipo): tipo de retorno
    create(data: UserCreate): Promise<User>;
}