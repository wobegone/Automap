#!/bin/bash
#.

clear

greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
darkGrayColour="\e[0;90m\033[1m"
lightRedColour="\e[0;91m\033[1m"
lightGreenColour="\e[0;92m\033[1m"
lightYellowColour="\e[0;93m\033[1m"
lightBlueColour="\e[0;94m\033[1m"
lightMagentaColour="\e[0;95m\033[1m"
lightCianColour="\e[0;96m\033[1m"
whiteColour="\e[0;97m\033[1m"

trap ctrl_c INT

function ctrl_c(){

	clear
	banner
        echo "Cerrando programa..."
        sleep 1.6
	echo "Adiós"
	sleep 0.2
	clear
	echo -e "${greenColour}❯ ${endColour}${blueColour}./automap.sh${endColour}"
        exit

}

function banner(){
echo -e " "
echo -e " "
echo -e " "
echo -e "\n${turquoiseColour}    ▄▄▄       █    ██ ▄▄▄█████▓ ▒█████   ███▄ ▄███▓ ▄▄▄       ██▓███  "
echo -e "   ▒████▄     ██  ▓██▒▓  ██▒ ▓▒▒██▒  ██▒▓██▒▀█▀ ██▒▒████▄    ▓██░  ██▒"
echo -e "   ▒██  ▀█▄  ▓██  ▒██░▒ ▓██░ ▒░▒██░  ██▒▓██    ▓██░▒██  ▀█▄  ▓██░ ██▓▒"
echo -e "   ░██▄▄▄▄██ ▓▓█  ░██░░ ▓██▓ ░ ▒██   ██░▒██    ▒██ ░██▄▄▄▄██ ▒██▄█▓▒ ▒"
echo -e "    ▓█   ▓██▒▒▒█████▓   ▒██▒ ░ ░ ████▓▒░▒██▒   ░██▒ ▓█   ▓██▒▒██▒ ░  ░"
echo -e "    ▒▒   ▓▒█░░▒▓▒ ▒ ▒   ▒ ░░   ░ ▒░▒░▒░ ░ ▒░   ░  ░ ▒▒   ▓▒█░▒▓▒░ ░  ░"
echo -e "     ▒   ▒▒ ░░░▒░ ░ ░     ░      ░ ▒ ▒░ ░  ░      ░  ▒   ▒▒ ░░▒ ░     "
echo -e "     ░   ▒    ░░░ ░ ░   ░      ░ ░ ░ ▒  ░      ░     ░   ▒   ░░       "
echo -e "     ░  ░   ░                  ░ ░         ░         ░  ░         ${endColour}"
echo -e " "
echo -e "        ${yellowColour}Herramienta para automatizar el uso de la herramienta${endColour}${blueColour} NMAP"
echo -e "        ${endColour}${yellowColour}      Creado por ${endColour}${blueColour}Av4sin${endColour}${yellowColour} -- ${endColour}${turquoiseColour}InfinitoPython${endColour}${yellowColour} -- ${endColour}${grayColour}Wobegone${endColour}"
echo -e " "
}

banner
echo -e "${yellowColour}[1] --> ${endColour}${redColour}Ver ip's en una subred${endColour}"
echo -e "${yellowColour}[2] --> ${endColour}${blueColour}Escaneo simple de puertos${endColour}"
echo -e "${yellowColour}[3] --> ${endColour}${purpleColour}Escaneo avanzado de puertos${endColour}"
echo -e "${yellowColour}[4] --> ${endColour}${greenColour}Busqueda de vulnerabilidades${endColour}"
echo -e "${yellowColour}[5] --> ${endColour}${grayColour}Sobre el programa y el desarrollador${endColour}"
echo -e "${yellowColour}[6] --> ${endColour}${turquoiseColour}Salir"
echo -e " "
echo -e " "
read -p "AutoMap@InfinitoPython   > " num
echo -e "${endColour}"
clear

if [[ num -eq 1 ]]
then
	banner
	echo " "
	echo "[*] Comenzando el escaneo de ip's con la herramienta NMAP..."
	echo " "
	echo "[*] Acuerdate de terminar la dirección ip con 0 ej: 192.168.43.0"
	echo " "
	read -p "ip: " ip1
	echo "ip ==> " $ip1
	echo " "
	echo "[*] NMAP se iniciará con permisos de administrador"
	echo " "
	sudo nmap -sP $ip1/24
	echo " "
	read -p "[.] Pulsa intro para continuar "
	./automap.sh

elif [[ num -eq 2 ]]
then
	banner
	echo " "
        echo "[*] Comenzando el escaneo de puertos simple con la herramienta NMAP..."
        echo " "
        read -p "ip : " ip2
        echo "ip ==> " $ip2
	echo " "
        echo "[*] NMAP se iniciará con permisos de administrador"
        echo " "
	sudo nmap $ip2
	echo " "
	read -p "[.] Pulsa intro para continuar "
        ./automap.sh

elif [[ num -eq 3 ]]
then
	banner
	echo -e " "
        echo -e "${yellowColour}[1] --> ${endColour}${redColour}Escaneo de puertos completo en una red${endColour}"
        echo -e "${yellowColour}[2] --> ${endColour}${blueColour}Escaneo de puertos en un rango de ip's${endColour}"
	echo -e "${yellowColour}[3] --> ${endColour}${purpleColour}Escaneo de puertos con identificacion de servicio, versiones y OS${endColour}"
	echo -e "${yellowColour}[4] --> ${endColour}${greenColour}Escaneo basado en llamadas UDP${endColour}"
	echo -e "${yellowColour}[5] --> ${endColour}${turquoiseColour}Intento de escaneo de puertos con identificación de servicio, versiones y OS evitando firewall"
	echo -e " "
	read -p "AutoMap@InfinitoPython   > " num2
	echo -e "${endColour} "
	clear
	if [[ num2 -eq 1 ]]
	then
		banner
		echo " "
        	echo "[*] Comenzando el escaneo de puertos completo en una red con la herramienta NMAP..."
        	echo " "
     		read -p "ip : " ip3
        	echo "ip ==> " $ip3
        	echo " "
        	echo "[*] NMAP se iniciará con permisos de administrador"
        	echo " "
        	sudo nmap $ip3/24
		echo " "
		read -p "[.] Pulsa intro para continuar "
             	./automap.sh

	elif [[ num2 -eq 2 ]]
	then
		banner
		echo " "
        	echo "[*] Comenzando el escaneo de puertos en un rango de ip's con la herramienta NMAP..."
        	echo " "
		read -p "Parte inicial de la ip (ej: 192.168.1.): " ip4
        	read -p "Parte final de la ip (ej: 24): " ip5
        	echo "ip 1 ==> " $ip4$ip5
		read -p "Parte final de la 2a ip (ej: 100): " ip6
		echo "ip 2 ==> " $ip4$ip6
        	echo " "
        	echo "[*] NMAP se iniciará con permisos de administrador"
       		echo " "
        	sudo nmap $ip4$ip5-$ip6
	        echo " "
		read -p "[.] Pulsa intro para continuar "
		./automap.sh

	elif [[ num2 -eq 3 ]]
        then
		banner
                echo " "
                echo "[*] Comenzando el escaneo de puertos con identificacion de servicio, versiones y OS con la herramienta NMAP..."
                echo " "
                read -p "ip : " ip7
                echo "ip ==> " $ip7
                echo " "
                echo "[*] NMAP se iniciará con permisos de administrador"
                echo " "
                sudo nmap -O -sV $ip7
		echo " "
		read -p "[.] Pulsa intro para continuar "
                ./automap.sh

        elif [[ num2 -eq 4 ]]
        then
		banner
                echo " "
                echo "[*] Comenzando el escaneo basado en UDP con la herramienta NMAP..."
                echo " "
                read -p "ip : " ip8
                echo "ip ==> " $ip8
                echo " "
                echo "[*] NMAP se iniciará con permisos de administrador"
                echo " "
                sudo nmap -sU $ip8
                echo " "
		read -p "[.] Pulsa intro para continuar "
                ./automap.sh

       elif [[ num2 -eq 5 ]]
        then
		banner
                echo " "
                echo "[*] Comenzando el intento de escaneo de puertos con identificación de servicio, versiones y OS evitando firewall con la herramienta NMAP..."
                echo " "
                read -p "ip : " ip9
                echo "ip ==> " $ip9
                echo " "
                echo "[*] NMAP se iniciará con permisos de administrador"
                echo " "
                sudo nmap -Pn -f $ip9
                echo " "
		read -p "[.] Pulsa intro para continuar "
                ./automap.sh
	fi

elif [[ num -eq 4 ]]
then
	banner
        echo -e " "
        echo -e "${yellowColour}[1] --> ${endColour}${redColour}Escanear los scripts de categoría vulnerabilidad contra un host${endColour}"
        echo -e "${yellowColour}[2] --> ${endColour}${blueColour}Más información sobre los scripts de NMAP${endColour}"
        echo -e "${yellowColour}[3] --> ${endColour}${purpleColour}Descripción de todos los scripts que buscan vulnerabilidades${endColour}"
        echo -e "${yellowColour}[4] --> ${endColour}${greenColour}Lanzar todos los scripts de un tipo determinado contra un host${endColour}"
	echo -e "${yellowColour}[5] --> ${endColour}${grayColour}Escanear vulnerabilidades sobre protocolo SMB en un host${endColour}"
	echo -e "${yellowColour}[6] --> ${endColour}${turquoiseColour}Evaluar una vulnerabilidad sobre toda nuestra red"
        echo -e " "
        read -p "AutoMap@InfinitoPython   > " num4
	echo -e "${endColour} "
	clear
	if [[ num4 -eq 1 ]]
	then
		banner
		echo " "
        	echo "[*] Comenzando el escaneo de los scripts de categoría vulnerabilidad contra un host con la herramienta NMAP..."
        	echo " "
     		read -p "Host (ej: scanme.nmap.com) : " host
        	echo "Host ==> " $host
        	echo " "
        	echo "[*] NMAP se iniciará con permisos de administrador"
        	echo " "
        	sudo nmap --script vuln $host
		echo " "
		read -p "[.] Pulsa intro para continuar "
		./automap.sh

	elif [[ num4 -eq 2 ]]
	then
		banner
		echo " "
        	echo "[*] Comenzando la búsqueda de más información sobre los scripts con la herramienta NMAP..."
        	echo " "
		read -p "Script (ej: http-slowloris) : " script
		echo "Script ==> " $script
        	echo " "
        	echo "[*] NMAP se iniciará con permisos de administrador"
       		echo " "
        	sudo nmap --script-help $script
	        echo " "
		read -p "[.] Pulsa intro para continuar "
       		./automap.sh

	elif [[ num4 -eq 3 ]]
        then
		banner
                echo " "
                echo "[*] Comenzando la descripción de todos los scripts que buscan vulnerabilidades con la herramienta NMAP..."
                echo " "
		echo "Script ==> vuln"
                echo " "
                echo "[*] NMAP se iniciará con permisos de administrador"
                echo " "
                sudo nmap --script-help vuln
	        echo " "
		read -p "[.] Pulsa intro para continuar "
                ./automap.sh

        elif [[ num4 -eq 4 ]]
        then
		banner
                echo " "
                echo "[*] Comenzando el despliegue de todos los scripts de un tipo determinado contra un host con la herramienta NMAP..."
                echo " "
		read -p "Script : " script2
		echo "Script ==> " $script2
                read -p "Host o ip : " host2
                echo "Host/ip ==> " $host2
                echo " "
                echo "[*] NMAP se iniciará con permisos de administrador"
                echo " "
                sudo nmap --script $script2-* $host2
	        echo " "
		read -p "[.] Pulsa intro para continuar "
           	./automap.sh

       elif [[ num4 -eq 5 ]]
        then
		banner
                echo " "
                echo "[*] Comenzando el escaneo de vulnerabilidades sobre protocolo SMB en un host con la herramienta NMAP..."
                echo " "
                read -p "Host o ip : " host3
                echo "Host o ip ==> " $host3
                echo " "
                echo "[*] NMAP se iniciará con permisos de administrador"
                echo " "
                sudo nmap --script smb-* $host3
                echo " "
                read -p "[.] Pulsa intro para continuar "
		./automap.sh

	elif [[ num4 -eq 6 ]]
        then
		banner
                echo " "
                echo "[*] Comenzando la evaluacion de una vulnerabilidad sobre toda nuestra red con la herramienta NMAP..."
                echo " "
                read -p "Script : " script3
                echo "Script ==> " $script3
                echo " "
                echo "[*] NMAP se iniciará con permisos de administrador"
                echo " "
                sudo nmap --script $script3
                echo " "
		read -p "[.] Pulsa intro para continuar "
                ./automap.sh
	fi
elif [[ num -eq 5 ]]
then

	echo -e "${grayColour}.-Automap"
	echo -e " "
        echo -e "Hola "
        echo -e " "
	echo -e "Este programa ha sido desarrollado con fines éticos como el de ayudar a hackers (éticos) con el uso de la herramienta de escaneo de redes NMAP"
	echo -e " "
	echo -e "Soy un estudiante apasionado por la informática propietario de la cuenta Wobegone en Github y del blog InfinitoPython con 511 usuarios a día 04/01/2022"
	echo -e " "
	echo -e "He creado este programa para facilitar el uso de la herramienta NMAP  ya que tiene gran cantidad de variables y usos y me parecía ilógico tenerse que aprender tal cantidad de comandos."
	echo -e " "
	echo -e "Puedes apoyarme siguiendome en Github y en Instagram y también suscribiendote a InfinitoPython"
	echo -e " "
	echo -e " "
	echo -e "Mis redes sociales "
	echo -e "${endColour} "
	echo -e "${redColour}·	Blogger --> https://infinitopython.blogspot.com${endColour}"
	echo -e "${greenColour}·	Github  --> https://github.com/wobegone${endColour}"
	echo -e "${purpleColour}·	Instagram-> @infinito_python${endColour}"
        echo -e "${grayColour} "
	echo -e " "
	echo -e " No me hago responsable si cometes actos delictivos y repercuten a la sociedad "
	echo -e " "
	echo -e "Si algún icono no se muestra se debe a la versión de la shell"
	echo -e "Este programa esta escrito completamente en shell con el programa vim"
	echo -e "${endColour}${turquoiseColour} "
	read -p "[.] Pulsa intro para continuar "
	echo -e "${endColour}"
	./automap.sh

elif [[ num -eq 6 ]]
then

	ctrl_c

else
	echo "¡Especifica un número!"
	echo " Locked for 2 seconds"
	sleep 1
	clear
	echo "¡Especifica un número!"
        echo " Locked for 1 second"
	sleep 1
	clear
	./automap.sh
fi

#          
