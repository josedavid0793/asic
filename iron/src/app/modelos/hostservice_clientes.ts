export class Hostservice_clientes{

	constructor(
        public id: number,
        public service_name: string,
        public host:string,
		public ip: string,
		public cliente: string,
		public ambiente: string,
		public sistema_operativo: string,
		public escalamiento : string,
		public notas : string,

		){}
}