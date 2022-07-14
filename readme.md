# What is this?

A small gentoo overlay with unusual software and (rarely) newer versions of existing software.

# How do I add this?

Install eselect-repository, if you haven'd done so:

    emerge app-eselect/eselect-repository

Then, add this repository:

    eselect repository add dalabs git https://github.com/chrschmidt/dalabs-overlay.git
