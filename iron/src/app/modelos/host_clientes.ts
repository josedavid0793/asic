export class Host_clientes{

	constructor(
        public id: number,
        public host_name:string,
		public ip: string,
		public cliente: string,
		public ambiente: string,
		public sistema_operativo: string,
		public escalamiento : string,
		public notas : string,

		){}
}
