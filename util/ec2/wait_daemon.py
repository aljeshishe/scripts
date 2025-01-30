import daemon
from wait import main

with daemon.DaemonContext():
    main()