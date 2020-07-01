export class User{
	constructor(
        public id: number,
        public usuario:string,
		public nombres: string,
		public apellidos: string,
		public correo: string,
		public password: string,
		public rol : string,

	){}
}