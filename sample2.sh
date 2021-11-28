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
