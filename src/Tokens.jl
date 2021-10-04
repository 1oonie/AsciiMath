module Tokens

abstract type AbstractToken end

struct Number <: AbstractToken
    value::Int
end

struct Parenthesis <: AbstractToken
    contains::String
end

struct Function <: AbstractToken
    name::String
    argument::String
end

abstract type AbstractOperator <: AbstractToken end

struct Plus <: AbstractOperator
    left::Union{Number, AbstractOperator}
    right::Union{Number, AbstractOperator}
end

struct Minus <: AbstractOperator
    left::Union{Number, AbstractOperator}
    right::Union{Number, AbstractOperator}
end

struct Mul <: AbstractOperator
    left::Union{Number, AbstractOperator}
    right::Union{Number, AbstractOperator}
end

struct Div <: AbstractOperator
    left::Union{Number, AbstractOperator}
    right::Union{Number, AbstractOperator}
end

end