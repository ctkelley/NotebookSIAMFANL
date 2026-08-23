function heq_graph_continuation(printbook = false)
    (pval, nval, H, cfinal) = heq_continue(129)
    plot(pval, nval, "k-")
    xlabel(L"$c$")
    ylabel(L"$|| H ||_1$")
    return printbook || title("Figure 5.4 in print book")
end
