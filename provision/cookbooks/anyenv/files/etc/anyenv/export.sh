
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
for D in `l $HOME/.anyenv/envs`
do
    export PATH="$HOME/.anyenv/envs/$D/bin:$PATH"
done

