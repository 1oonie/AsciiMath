module Tokens

abstract type AbstractToken end

struct Num <: AbstractToken
    value::Number
end

struct Parenthesis <: AbstractToken
    contains::String
end

struct Function <: AbstractToken
    func::Any
    argument::String
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

struct Pow
end