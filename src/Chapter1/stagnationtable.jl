"""
stagnationtable()

This is the Julia code for the tan(x) = x example.

This code makes Table 1.1 in the print book.

See the notebook.

"""
function stagnationtable()
    ftout = nsolsc(
        x -> tan(x) - x,
        4.5;
        maxit = 14,
        rtol = 1.0e-17,
        atol = 1.0e-17,
        printerr = false,
    )
    return printhist(ftout.history[1:6], ["|f(x)|"])
end
