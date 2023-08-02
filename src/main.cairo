
#[starknet::interface]
trait IHelloWorld<IContractState> {
    fn read_hello_world(self: @IContractState) -> felt252;

    fn write_hello_world(ref self: IContractState, new_message: felt252);
}

#[starknet::contract]
mod contract {
    #[storage]
    struct Storage {
        hello_world: felt252,
    }

    #[constructor]
    fn constructor(ref self: ContractState) {
        self.hello_world.write('Hello Encode!');
    }

    #[external(v0)]
    impl HelloWorldInterface of super::IHelloWorld<ContractState> {
        fn read_hello_world(self: @ContractState) -> felt252 {
            self.hello_world.read()
        }

        fn write_hello_world(ref self: ContractState, new_message: felt252) {
            self.hello_world.write(new_message);
        }
    }
}