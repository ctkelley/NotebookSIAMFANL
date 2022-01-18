function plot_its_funs(plot_hist, caption)
pstr=["k.","k-.","k-","k--","k-o"]
subplot(1,2,1)
plot_res_vs_its(plot_hist, pstr, caption)
subplot(1,2,2)
plot_res_vs_fevals(plot_hist, pstr)
end

function plot_res_vs_fevals(plot_hist,pstr)
xlab=("Function Evaluations")
ylab=("")
ip=1
for D4P in plot_hist
semilogy(D4P.fdata, D4P.relreshist, pstr[ip])
ip+=1
end
xlabel(xlab)
ylabel(ylab)
end


function plot_res_vs_its(plot_hist, pstr, caption)
xlab=("Iterations")
ylab=("Relative residual")
inlegend=Vector{String}()
ip=1;
for D4P in plot_hist
push!(inlegend,D4P.legend)
semilogy(D4P.itdata, D4P.relreshist, pstr[ip])
ip+=1
end
legend(inlegend)
xlabel(xlab)
ylabel(ylab)
(caption == nothing) || title(caption)
end

function nl_stats!(plot_hist, nlout, legendstr; method=:nk)
fdata=nl_funcount(nlout; method=method)
xlen=length(nlout.history)
itdata=collect(0:1:xlen-1)
relreshist=nlout.history./nlout.history[1]
DT=Data_4_Plots(relreshist, itdata, fdata, legendstr)
push!(plot_hist,DT)
end

function nl_stats!(itdata, fdata, relreshist, nlout; method=:nk)
push!(fdata,nl_funcount(nlout; method=method))
xlen=length(nlout.history)
push!(itdata,collect(0:1:xlen-1))
push!(relreshist,nlout.history./nlout.history[1])
end

function nl_funcount(nout; method=:nk)
if method == :nk
fout=nout.stats.ifun+nout.stats.ijac+nout.stats.iarm
ftot=cumsum(fout)
else 
xlen=length(nout.history)
ftot = collect(1:1:xlen)
end
end

