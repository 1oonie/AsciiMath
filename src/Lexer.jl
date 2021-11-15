module Lexer

include("Tokens.jl")

function lex(code::String)::Vector{Tokens.AbstractToken}
    result::Vector{Tokens.AbstractToken} = Vector{Tokens.AbstractToken}()
    pos::Int = 1

    while length(code) >= pos
        c::Char = code[pos]
        
        if isdigit(c)
            number::Vector{Char} = Vector{Char}()
            push!(number, c)
            
            haspoint::Bool = false
            pos += 1
            while length(code) >= pos
                c = code[pos]
                if isdigit(c)
                    push!(number, c)
                elseif c == '.'
                    if haspoint
                        throw("two decimal points in a number literal not allowed!")
                    else
                        push!(number, c)
                        haspoint = true
                    end
                else
                    break
                end
                pos += 1
            end
        
        
            if haspoint
                push!(result, Tokens.Num(parse(Float64, join(number))))
            else
                push!(result, Tokens.Num(parse(Int64, join(number))))
            end
            pos -= 1

        elseif c == '+'
            push!(result, Tokens.Plus())
        elseif c == '-'
            push!(result, Tokens.Minus())
        elseif c == '*'
            push!(result, Tokens.Mul())
        elseif c == '/'
            push!(result, Tokens.Div())
        elseif c == '^'
            push!(result, Tokens.Pow())
    
        elseif c == '('
            push!(result, Tokens.RBrace())
        elseif c == ')'
            push!(result, Tokens.LBrace())
        else
            throw("unexpected token '$c'")
        end
        
        pos += 1
    end

    return result
end

end