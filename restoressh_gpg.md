## Backup

1. Copy both id_rsa and id_rsa.pub from ~/.ssh/ to a USB drive. Identify the private key by executing the following command.
    ```
    gpg --list-secret-keys --keyid-format LONG
    ```
2. It will show something similar to this.
    ```
    sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
    ```
3. Characters after the slash are the ID of the private key. Export the private key.
    ```
    gpg --export-secret-keys $ID > my-private-key.asc
    ```
4. Copy my-private-key.asc to a USB drive.

## Restore

1. Copy both id_rsa and id_rsa.pub to ~/.ssh/
2. Change file permissions and ownership of both files.
    ```
    chown user:user ~/.ssh/id_rsa*
    chmod 600 ~/.ssh/id_rsa
    chmod 644 ~/.ssh/id_rsa.pub
    ```
3. Start the ssh-agent.
    ```
    exec ssh-agent bash
    ```
4. Add your SSH private key to the ssh-agent.
    ```
    ssh-add ~/.ssh/id_rsa
    ```
5. Import your GPG key
    ```
    gpg --import my-private-key.asc
    ```
