module Tokens

abstract type AbstractToken end

struct Num <: AbstractToken
    value::Number
end

struct RBrace <: AbstractToken
end

struct LBrace <: AbstractToken
end

abstract type AbstractOperator <: AbstractToken end

struct Plus <: AbstractOperator
end

struct Minus <: AbstractOperator
end

struct Mul <: AbstractOperator
end

struct Div <: AbstractOperator
end

struct Pow <: AbstractOperator
end

end