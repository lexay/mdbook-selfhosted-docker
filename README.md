### About

A simple set-up for hosting your knowledge base on a server, using NGINX and
Docker. With the help of the [mdBook][1] utility, the knowledge base is compiled
from markdown into HTML files and served as static html content with NGINX.

### SSL Certificates

For SSL to work properly you should generate selfsigned certificates, this
[detailed guide][2] can help you out. Put the generated key and corresponding
certificate named `<domain_name>.key` and `<domain_name>.crt` respectively to
the `ssl` directory.

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

[1]: https://github.com/rust-lang/mdBook
[2]: https://github.com/ChristianLempa/cheat-sheets/blob/main/misc/ssl-certs.md
