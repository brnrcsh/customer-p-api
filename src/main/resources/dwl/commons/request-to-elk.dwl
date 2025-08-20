%dw 2.0
output application/json
---
{
	"type": if(attributes."method" == "POST") "Criação" 
			else if(attributes."method" == "PUT") "Alteração"
			else if(attributes."method" == "DELETE") "Deleção"
			else "Consulta",
	"@timestamp": now(),
	"@correlationId": vars."x-correlation-id",
	
	customer: if(attributes.headers."method" == "GET") ( {
		birthday: payload.birthday default "",
		address: payload.address default "",
		bonus: payload.bonus default "",
		document: payload.document default "",
		name: payload.name default "",
		id: vars.id default ""
	} )else ( {} )
		
}