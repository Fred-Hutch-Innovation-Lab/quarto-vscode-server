1. Build the Apptainer .sif from the def file here
```
ml purge
ml Apptainer
apptainer build quarto-code-server.sif quarto-code-server.def
```
2. Create an interactive session with Screen or something similar
3. Allocate an interactive node. Using `salloc` is preferred over `grabnode` due to the automatic assignment of a `tmpdir`
4. Launch the apptainer. Make sure `/var/tmp` is writeable for unpacking vs-code server (needed for first time installations)
```
apptainer run \
    -B /var/tmp:$TMPDIR \
    -B /fh/fast/_IRC/FHIL \
    positron3.sif \
    code tunnel
```
5. Follow the in-terminal prompts to setup and connect to the vs-code server. Navigate to your project directory.
    -  When you first open the server in your project, give the app a minute to set up extensions. These extensions will allow jupyter environments to be auto-detected and loaded when opening terminals.
6. Run `quarto check` in the terminal to ensure all langauges and extensions are properly loaded.
7. You can add extensions as needed (e.g. syntax help or linters). These should not affect the ability of other users to work with the code in a project. 
8. If you want to preview a quarto document, you will have to set the host to `0.0.0.0` and manually navigate to the address of the host-node with the port given by the `quarto preview` output. The built in viewer doesn't seem to play well with the 'local host'
```
quarto preview mydoc.qmd --no-browser --host 0.0.0.0
```
Then you can go to `<$(hostname)>.fhcrc.org:<port>` to preview the live output

