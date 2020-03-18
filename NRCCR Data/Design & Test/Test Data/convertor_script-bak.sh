#!/usr/bin/env sh
for i in 'finals*'
	do
		rm -rf column*
		cat $i | cut -d"," -f1,2 > column12
		cat $i | cut -d"," -f4,6 | sed -e 's/\"  /\"/g' | sed -e 's/"  /\"/g' | sed -e 's/ \"/\"/g' | sed -e 's/\/  /\",\"/g' | sed -e 's/\",\" /\",\"/g' | sed -e 's/\",\" /\",\"/g' > column46
		cat $i | cut -d"," -f7 | sed -e 's/^/\"F/g' | sed -e 's/$/\"/g' > column7
		cat $i | cut -d"," -f8 | sed -e 's/d\"$/\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' > column8
		cat $i | cut -d"," -f9 > column9
		export j=`echo $i | cut -d" " -f2`
		export k=`echo $j | cut -c1-2`
		export l=`echo $j | cut -c3-4`
		export m=`echo $j | cut -c5-6`
		export n=`echo "20"$m-$l-$k`
		export filename=`echo "Finals-20"$m$l$k-readytoload.csv`
		paste -d ',' column12 column46 > column1246
		paste -d ',' column1246 column7 > column12467
		paste -d ',' column12467 column8 > column124678
		paste -d ',' column124678 column9 > column1246789
		cat column1246789 | grep -v "DNS" | sed -e 's/\"\"/\"\,\"/g' | sed -e "s/$/\,$n/g" > column12467890
		export newheader=`echo "\"Driver Name\",\"Race Class\",\"Qual Result Laps\",\"Qual Result Time\",\"Race Result Laps\",\"Race Results Time\",\"Round or Leg\",\"Race Lap Time\",\"Race Lap Number\",\"Race Date\""`
		sed -i "1s/.*/$newheader/" column12467890
		mv column12467890 $filename
		rm -rf column*
		echo "Produced file "$filename
	done
for i in 'heats*'
	do
		rm -rf column*
		cat $i | cut -d"," -f1,2 > column12
		cat $i | cut -d"," -f4,6 | sed -e 's/\"  /\"/g' | sed -e 's/"  /\"/g' | sed -e 's/ \"/\"/g' | sed -e 's/\/  /\",\"/g' | sed -e 's/\",\" /\",\"/g' | sed -e 's/\",\" /\",\"/g' > column46
		cat $i | cut -d"," -f7 | sed -e 's/^/\"F/g' | sed -e 's/$/\"/g' > column7
		cat $i | cut -d"," -f8 | sed -e 's/d\"$/\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' | sed -e 's/^\" /\"/g' > column8
		cat $i | cut -d"," -f9 > column9
		export j=`echo $i | cut -d" " -f2`
		export k=`echo $j | cut -c1-2`
		export l=`echo $j | cut -c3-4`
		export m=`echo $j | cut -c5-6`
		export n=`echo "20"$m-$l-$k`
		export filename=`echo "Heats-20"$m$l$k-readytoload.csv`
		paste -d ',' column12 column46 > column1246
		paste -d ',' column1246 column7 > column12467
		paste -d ',' column12467 column8 > column124678
		paste -d ',' column124678 column9 > column1246789
		cat column1246789 | grep -v "DNS" | sed -e 's/\"\"/\"\,\"/g' | sed -e "s/$/\,$n/g" > column12467890
		export newheader=`echo "\"Driver Name\",\"Race Class\",\"Qual Result Laps\",\"Qual Result Time\",\"Race Result Laps\",\"Race Results Time\",\"Round or Leg\",\"Race Lap Time\",\"Race Lap Number\",\"Race Date\""`
		sed -i "1s/.*/$newheader/" column12467890
		mv column12467890 $filename
		rm -rf column*
		echo "Produced file "$filename
	done
