### About

A simple set-up for hosting your knowledge base on a server, using NGINX and
Docker. With the help of the [mdBook][1] utility, the knowledge base is compiled
from markdown into HTML files and served as static html content with NGINX.

### SSL Certificate

For SSL to work properly you should get a key and certificate:
* from any valid CA, e.g.: `letsencrypt` via `certbot`.
* or create them yourself, this [detailed guide][2] can help you out.

 N.B.: if you chose the second option, you should add the generated certificate
 manually to every device, you are going to visit your web-server from.

After you have obtained the key and certificate, rename them `<domain_name>.key`
and `<domain_name>.crt` respectively and put them to the `ssl` directory.

### Knowledge base source

Copy everything from the root directory of the knowledge base or clone it to the
`book` directory.

```bash
$ git clone <kb_source> book/
```

### Environment variables
Host IP and name can be the same if you serve it on a local machine and do not
want to mess with the `hosts` file.

```env
# .env
HOST_IP=''
HOST_NAME=''
```

### How to automate updates of knowledge base on server

Every time you make changes to your knowledge base, it should be recompiled by
the `mdbook` tool into HTML again to reflect those changes on your server.

Do you need this? Of course not, if you work on you knowledge base from time to
time. You just recompile manually.

I do frequent edits and updates to my KB, so some automation wont hurt. :-)


#### Git based approach

If your knowledge base source is tracked by Git, one of the easy solutions to
that would be a cron-job scheduled to run `git pull` every *n* minutes and run
git `post-merge` hook after the changes have been successfully merged.

1. Create a cron job

```bash
$ crontab -e
```

```crontab
*/<minutes> * * * * <path_to_script>
```

and the the cron job script.

```bash
# .local/share/scripts

#!/usr/bin/env bash
KB_SOURCE_GIT_REPO='<path_to_kb_source_repo>'
cd $KB_SOURCE_GIT_REPO
git pull
```

2. Create a `post-merge` hook in the knowledge base source repository.

```bash
# book/.git/hooks/post-merge

#!/usr/bin/env bash
COMPOSE_FILE='<path_to_docker_compose_file>'
docker compose --file $COMPOSE_FILE restart builder
```

This solves 2 problems:

a. You dont need to `git pull` changes manually.

b. mdbook recompiles source of your knowledge base on the fly, you dont even
need to restart the server.

[1]: https://github.com/rust-lang/mdBook
[2]: https://github.com/ChristianLempa/cheat-sheets/blob/main/misc/ssl-certs.md
