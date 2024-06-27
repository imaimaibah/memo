# ^と~の違い

[参考リンク](https://stackoverflow.com/questions/2221658/whats-the-difference-between-head-and-head-in-git)
![image](./img/difference.png)

# 任意のラインを変更したログを検索

[参考リンク](https://www-creators.com/archives/1782)

```
> git log -L START_LINE,END_LINE:FILENAME
```

`git blame`でもいい

# あるコミットの特定のファイルのみCherry-pick

[参考リンク1](https://codehero.jp/git/5717026/how-to-git-cherry-pick-only-changes-to-certain-files)

[参考リンク2](https://zenn.dev/rabbit/articles/437b4bdc6edbc3)

```
> git cherry-pick -n <commit-id>
```

# Revert

Revertの仕方

# 2ドットと３ドット

![image](./img/2or3dots.png)

> git diff A...B = git diff $(git merge-base A B) B


# プロキシ経由でgit clone

.ssh/configを下記の様にセットアップします。

```
Host=foo.server.com
ProxyCommand=socat - PROXY:your.proxy.ip:%h:%p,proxyport=3128,proxyauth=user:pwd
```

foo.server.comへssh出来るようになっているはずです。

```
> ssh -T git@foo.server.com
```

git cloneしてみます。

```
> git clone ssh://foo.server.com/var/git/myrepo.git
```

# 特定のファイルをstashする方法

```
> git stash push -m "stash test" -- ./git_tips.md
```

# 特定のstashリストのファイルの差分を確認する
```
> git diff stash@{[番号]}　-- [ファイル名]
```

# stashしたファイル群から特定ファイルを取り出す
```
> git checkout stash@{[番号]} -- [ファイル名]
```
