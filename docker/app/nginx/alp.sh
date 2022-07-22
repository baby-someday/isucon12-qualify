#!/bin/bash

alp ltsv --file access.log -m "/icons/.+,/history/.+,/channel/.+,/profile/.+" --sort sum -r > alp.txt