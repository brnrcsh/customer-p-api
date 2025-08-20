%dw 2.0
output application/java
---
{
	"x-correlation-id": vars."x-correlation-id",
	"trace-id": vars.OTEL_TRACE_CONTEXT.traceId,
	method: attributes.method
}