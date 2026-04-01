# Example 3 Spring Boot AOP-Based Proxy (Enterprise Grade)

📊 UML – AOP Proxy
classDiagram

class InferenceService {
    +infer()
}

class InferenceServiceImpl {
    +infer()
}

class AuthAspect {
    +@Around authorize()
}

class LoggingAspect {
    +@Around log()
}

class RateLimitAspect {
    +@Around limit()
}

class SpringAOPProxy

InferenceService <|.. InferenceServiceImpl
SpringAOPProxy --> InferenceServiceImpl
AuthAspect --> SpringAOPProxy
LoggingAspect --> SpringAOPProxy
RateLimitAspect --> SpringAOPProxy