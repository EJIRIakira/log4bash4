# log4bash4 ver1.0
Logging in bash4
A logger that can be used with bash4 scripts.
It is implemented with Bash 4.2 functions.
This is a Bash-specific logger because it uses Badh-specific functions.
It uses coproc, so it will not work with Bash versions less than 4.0.

Outputs the specified message to the screen and log file.
It does not have a log rotation function, but it does have a backup function when the log file exceeds the specified size.
There are six log levels: fatal, error, warn, info, debug, and trace.



# DEMO
### shell-script(sample.sh)
```bash{.line-numbers}
#!/bin/bash
. log4bash4 #or source log4bash4

log4bash_fatal "AAA" "aaa"
log4bash_error "BBB" "bbb"
log4bash_warn "CCC"
log4bash_info "DDD"
log4bash_debug "EEE"
log4bash_trace "FFF"
```
### execution
```
bash sample.sh
```



### output
```text
[2021/11/27 17:50:26.553453400] fatal [26753:26753:26374] [sample.sh(4):---] [LOGID_26753_0] AAA aaa
[2021/11/27 17:50:26.562529500] error [26753:26753:26374] [sample.sh(5):---] [LOGID_26753_0] BBB bbb
```
In the default configuration, info, debug, and trace are not output.

----
### shell-script(sample2.sh)
```bash{.line-numbers}
#!/bin/bash
. log4bash4

log4bash_info top start
f1(){
        log4bash_info f1 start
        f11 A B C
        f12 A B C
        log4bash_info f1 end
}
f11(){
        log4bash_info f11 start
        log4bash_info f11 end
}
f12(){
        log4bash_info f12 start
        f121 A B C
        f122 A B C
        log4bash_info f12 end
}
f121(){
        log4bash_info f121 start
        log4bash_info f121 end
}
f122(){
        log4bash_info f122 start
        f1221 A B C
        log4bash_info f122 end
}
f1221(){
        log4bash_info f1221 start
        f12211 A B C
        log4bash_info f1221 end
}
f12211(){
        log4bash_info f12211 start
        f122111 A B C
        log4bash_info f12211 end
}
f122111(){
        log4bash_info f122111 start
        f1221111 A B C
        log4bash_info f122111 end
}
f1221111(){
        log4bash_info f1221111 start
        f12211111 A B C
        log4bash_info f1221111 end
}
f12211111(){
        log4bash_info f12211111 start
        log4bash_info f12211111 end
}
f2(){
        log4bash_info f2 start
        f21 A B C
        f22 A B C
        log4bash_info f2 end
}
f21(){
        log4bash_info f21 start
        log4bash_info f21 end
}
f22(){
        log4bash_info f22 start
        log4bash_info f22 end
}
main(){
        log4bash_info main start
        f1
        f2
        log4bash_info main end
}
main
log4bash_info top end
```
### execution
```
export __LOG4BASH_LOGLEVEL_INFO='1'
bash sample2.sh
```


### output
```text
[2021/11/27 19:17:32.017190200] info [26988:26988:26374] [sample2.sh(4):---] [LOGID_26988_0] top start
[2021/11/27 19:17:32.029297100] info [26988:26988:26374] [sample2.sh(69):main] [LOGID_26988_0] main start
[2021/11/27 19:17:32.041691000] info [26988:26988:26374] [sample2.sh(6):f1] [LOGID_26988_0] f1 start
[2021/11/27 19:17:32.052703800] info [26988:26988:26374] [sample2.sh(12):f11] [LOGID_26988_0] f11 start
[2021/11/27 19:17:32.061418000] info [26988:26988:26374] [sample2.sh(13):f11] [LOGID_26988_0] f11 end
[2021/11/27 19:17:32.070619500] info [26988:26988:26374] [sample2.sh(16):f12] [LOGID_26988_0] f12 start
[2021/11/27 19:17:32.084370100] info [26988:26988:26374] [sample2.sh(22):f121] [LOGID_26988_0] f121 start
[2021/11/27 19:17:32.095512200] info [26988:26988:26374] [sample2.sh(23):f121] [LOGID_26988_0] f121 end
[2021/11/27 19:17:32.108312900] info [26988:26988:26374] [sample2.sh(26):f122] [LOGID_26988_0] f122 start
[2021/11/27 19:17:32.118661900] info [26988:26988:26374] [sample2.sh(31):f1221] [LOGID_26988_0] f1221 start
[2021/11/27 19:17:32.126694400] info [26988:26988:26374] [sample2.sh(36):f12211] [LOGID_26988_0] f12211 start
[2021/11/27 19:17:32.135660100] info [26988:26988:26374] [sample2.sh(41):f122111] [LOGID_26988_0] f122111 start
[2021/11/27 19:17:32.147299600] info [26988:26988:26374] [sample2.sh(46):f1221111] [LOGID_26988_0] f1221111 start
[2021/11/27 19:17:32.157371900] info [26988:26988:26374] [sample2.sh(51):f12211111] [LOGID_26988_0] f12211111 start
[2021/11/27 19:17:32.168042100] info [26988:26988:26374] [sample2.sh(52):f12211111] [LOGID_26988_0] f12211111 end
[2021/11/27 19:17:32.176955600] info [26988:26988:26374] [sample2.sh(48):f1221111] [LOGID_26988_0] f1221111 end
[2021/11/27 19:17:32.187165100] info [26988:26988:26374] [sample2.sh(43):f122111] [LOGID_26988_0] f122111 end
[2021/11/27 19:17:32.195546900] info [26988:26988:26374] [sample2.sh(38):f12211] [LOGID_26988_0] f12211 end
[2021/11/27 19:17:32.205043800] info [26988:26988:26374] [sample2.sh(33):f1221] [LOGID_26988_0] f1221 end
[2021/11/27 19:17:32.215294800] info [26988:26988:26374] [sample2.sh(28):f122] [LOGID_26988_0] f122 end
[2021/11/27 19:17:32.223707700] info [26988:26988:26374] [sample2.sh(19):f12] [LOGID_26988_0] f12 end
[2021/11/27 19:17:32.232832400] info [26988:26988:26374] [sample2.sh(9):f1] [LOGID_26988_0] f1 end
[2021/11/27 19:17:32.240810300] info [26988:26988:26374] [sample2.sh(55):f2] [LOGID_26988_0] f2 start
[2021/11/27 19:17:32.248366200] info [26988:26988:26374] [sample2.sh(61):f21] [LOGID_26988_0] f21 start
[2021/11/27 19:17:32.258910200] info [26988:26988:26374] [sample2.sh(62):f21] [LOGID_26988_0] f21 end
[2021/11/27 19:17:32.268228500] info [26988:26988:26374] [sample2.sh(65):f22] [LOGID_26988_0] f22 start
[2021/11/27 19:17:32.276716500] info [26988:26988:26374] [sample2.sh(66):f22] [LOGID_26988_0] f22 end
[2021/11/27 19:17:32.284413100] info [26988:26988:26374] [sample2.sh(58):f2] [LOGID_26988_0] f2 end
[2021/11/27 19:17:32.293958100] info [26988:26988:26374] [sample2.sh(72):main] [LOGID_26988_0] main end
[2021/11/27 19:17:32.302795000] info [26988:26988:26374] [sample2.sh(75):---] [LOGID_26988_0] top end
```

The environment variable __LOG4BASH_LOGLEVEL_INFO is set to '1', so the log of the info log level will be output. You can also specify the log level in the configuration file.

----
# Features
 
A lightweight and fast logger available in Bash.
Written as a shell script function, no special libraries required.
Even if you can't change it in the configuration, you can rewrite the shell script for greater flexibility in customization.


# Requirement
* Bash version 4.0 or higher
 
# Installation
 
Place log4bash4 in an appropriate directory through your PATH.

# Usage
 
You can use it by placing `log4bash4` in an appropriate directory and loading it with `source` or `.` If you put it in a directory without `PATH`, you need to load it by pathname.
It works even if the file name is changed, and no processing depends on the file name.

|API|function|
|:--|:--|
|. log4bash4<BR>or<BR>source log4bash4|Reading log4bash4|
|log4bash_fatal|Fatal log output|
|log4bash_error|Error log output|
|log4bash_warn|Warning log output|
|log4bash_info|Information log output|
|log4bash_debug|Debug log output|
|log4bash_trace|Trace log output|
### output format
```
(1)                             (2)   (3)                 (4)                  (5)             (6)
[2018/03/20 08:30:23.103357501] trace [23390:23390:23361] [sample.sh(10):main] [LOGID_23390_0] ABCDEFG...
```
|No|item|exposition|
|:-:|:--|:--|
|(1)|date time|[%Y/%m/%d %H:%M:%S.%N]<BR>It can be specified in the same format as the `date`.|
|(2)|log level|`fatal` `error` `warn` `info` `debug` `trace`|
|(3)|process ID|$$:BASHPID:PPID   |
|(4)|caller|file name(line no):function name<BR>If it is outside the function, it will be '---'.|
|(5)|LOG ID|```LOGID_$$_${BASH_SUBSHELL}```|
|(6) |messages||


### customize
By changing the value of the environment variable, you can change the behavior of some features of "**log4bash4**".

Environment variables can also be defined in the configuration file.
You can also define the environment variables in the configuration file "**log4bash.conf**" and place it in the same directory as the shell script to be executed.
If you set the pathname of the configuration file to the environment variable `LOG4BASH_CONF`, it will refer to it.



|environment variable|default value|exposition|
|:--|:--|:--|
|\_\_LOG4BASH_DATE_FORMAT|'+[%Y/%m/%d %H:%M:%S.%N]'|date format|
|\_\_LOG4BASH_EABLE_DISP|'1'|'1':Enable screen display<BR>'0':Disable screen display|
|\_\_LOG4BASH_DISP_TTY|'/dev/stdout'|Display destination|
|\_\_LOG4BASH_EABLE_LOG|'1'|'1':Enable logging<BR>'0':Disable logging|
|\_\_LOG4BASH_LOGFILE_PATH|'/tmp/log4bash.log'|log file path|
|\_\_LOG4BASH_EABLE_LOG_BK|'1'|'1':Enable log file backup<BR>'0':Disable log file backup|
|\_\_LOG4BASH_LOGFILE_CHANGE_SIZE|'1000000'|Backup trigger size|
|\_\_LOG4BASH_LOGFILE_BK_PATH|'/tmp/log4bash.log.bk'|log-backup file path|
|\_\_LOG4BASH_LOGLEVEL_FATAL|'1'|'1':Enable<BR>'0':Disable|
|\_\_LOG4BASH_LOGLEVEL_ERROR|'1'|'1':Enable<BR>'0':Disable|
|\_\_LOG4BASH_LOGLEVEL_WARN|'1'|'1':Enable<BR>'0':Disable|
|\_\_LOG4BASH_LOGLEVEL_INFO|'0'|'1':Enable<BR>'0':Disable|
|\_\_LOG4BASH_LOGLEVEL_DEBUG|'0'|'1':Enable<BR>'0':Disable|
|\_\_LOG4BASH_LOGLEVEL_TRACE|'0'|'1':Enable<BR>'0':Disable|
|\_\_LOG4BASH_STRICT_APPEND|'1'|'1':append<BR>'0':redirect```>>```|
|\_\_LOG4BASH_LOGID|``LOGID_$$_${BASH_SUBSHELL}``|LOG ID<BR>You can specify any string to identify the log.|
|LOG4BASH_CONF|```$(dirname $0)/"log4bash.conf"```|configuration file<BR>A configuration file that defines environment variables.|

### setting for fast execution

```
export __LOG4BASH_ENABLE_DYNAMIC_CHANGE_LOGLEVEL='0'
export __LOG4BASH_LOGLEVEL_INFO='1'
export __LOG4BASH_LOGLEVEL_DEBUG='1'
export __LOG4BASH_LOGLEVEL_TRACE='1'
export __LOG4BASH_STRICT_APPEND='0'
export __LOG4BASH_EABLE_DISP='1'
export __LOG4BASH_DISP_TTY='/tmp/log4bash.log'
export __LOG4BASH_EABLE_LOG='0'
```
Redirect the screen display to a file without using the logging feature of log4bash4.




# Note
 
The log file is switched exclusively in case multiple processes output logs.
The lock directory `${LOG4BASH_LOGFILE_PATH}".d` is created at the start of the exlusive control and removed at the end of the exlusive control. If an abnormal termination (or forced termination) occurs between the start and end of the exlusive control, the lock directory will remain and the process will hang. In this case, you need to delete the lock directory manually.
In such a case, the hang-up will not be resolved until the lock directory is manually removed.

The `CO process` is created by `coproc`, and it is the same as the normal process started by `&`, so it is the target of `wait`.
In the following example, the process ID is specified to `wait`, so `wait` will be terminated when sleep is terminated.

The following case is not a problem.

```bash{.line-numbers}
#!/bin/bash
# OK
. ./log4bash4

log4bash_info "The first logging will create a CO process."
( echo "sleeping 5"; sleep 5;echo "sleeped 5"; )&
p1=$!
echo "waiting"
wait ${p1} #Since we are waiting with a process ID, we will return from the wait when sleep ends.
echo "waited"
```
The following case is a problem. Because you don't `wait` with a process ID, `wait` also waits for the CO process created by log4bash_info to terminate, and `wait` doesn't terminate even if sleep terminates.


```bash{.line-numbers}
#!/bin/sh
# NG
. ./log4bash4

log4bash_info "The first logging will create a CO process."
( echo "sleeping 5"; sleep 5;echo "sleeped 5"; )&
echo "waiting"
wait #Since the process ID is not specified, it does not return from wait even if sleep ends; it waits for the CO process to exit.
echo "waited"
```

The output of the log file is done by the CO process. For this reason, the output of the log file may not be completed immediately after the logging process exits.
 
# Author
* Author : EJIRI akira
* E-mail : pushpull.305@gmail.com
 
# License
Copyright (c) 2018 EJIRI akira
This software(log4bash4) is released under the MIT License, see LICENSE.txt.
