import type { User, UserRepository } from "../interfaces/user.interfaces.js";

class UserRepositoryPrisma implements UserRepository {
    // Async, já que são operações que vme do banco
    async create(data: UserCreate): Promise<User> {
        
    }
}