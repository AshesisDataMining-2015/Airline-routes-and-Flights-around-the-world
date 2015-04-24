# preproc.sh, cwj, 2/22/2015
# prepare world airline network file gml
#grep 'Africa' airports.dat > africa-airports.dat
#cat shortairports.dat shortroutes.dat 
#preproc.sh, a shell script for Australian Airline graph
# cwj, 2/24/2015
# airports.dat and routes.dat both come from
# http://openflights.org/data.html
# the gml file can be imported to Gephi for further processing.
cat airports.dat routes.dat | gawk ' 
BEGIN { print "graph"
              print "[ directed 1"
        numberarcs = 0			  }
	{ split($0,a,",")
	  if(a[1] ~ /^[0-9]+$/) { 
	  # lines starting with numbers are airports
	  airport[a[1]] = a[5] # airport number in field 1
	                       # airport 3-letter code in field 5
	 
	    african[a[1]] = 1 
	  # field #12 contains the continent and city
	  #print "new airport: " a[1] " = " a[5]
	  } else { 
	  # other lines are routes, field 4 takeoff number, 6 landing
	  if(a[4] in airport) {
	    if(a[6] in airport) {
		  if(african[a[4]]==1 || african[a[6]]==1) {
		  pair = a[4] "-" a[6]
	      airporthere[a[4]+0] = 1
	      airporthere[a[6]+0] = 1 
		  #print "legal pair " pair
	  if (pair in pairhash) {
	  #print "repeat of pair " pair
      pairhc[pair] = pairhc[pair] + 1 } else {
	  #print "new pair #" pair
	  numberarcs++
	  takeoff[numberarcs] = a[4]
	  landing[numberarcs] = a[6]
      pairhash[pair] = sprintf("\tedge [\n\t\tsource %d\n\t\ttarget %d\n\t]\n",a[4],a[6])
	  pairhc[pair] = 1 } } } } }
	}
END { # copy indices
	j = 1
	for (ap in airporthere) {
		ind[j] = ap    # index value becomes element value
		#print "used airport " ap " store in " j
		j++
	}
	n = asort(ind,ind2)    # index values are now sorted
	for (i = 1; i <= n; i++) {
      #print "airport listing: i " i " ind2[i]=" ind2[i] " name=" airport[ind2[i]]
	  backwards[ind2[i]] = i
	  print "\tnode ["
	  print "\t\tdebug " ind2[i]
	  print "\t\tid " i
	  print "\t\tlabel " airport[ind2[i]]
	  print "\t]" 
	  }
	  for (arc=1; arc<= numberarcs; arc++) {
	  print "\tedge ["
	  #print "\t\tsource " takeoff[arc] " = " backwards[takeoff[arc]]
	  print "\t\tsource " backwards[takeoff[arc]]
	  #print "\t\ttarget " landing[arc] " = " backwards[landing[arc]]
	  print "\t\ttarget " backwards[landing[arc]]
	  print "\t]" }
	}' > airports.gml