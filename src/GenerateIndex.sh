if [ "$1" == "-h" ]; then
	echo ""
	echo "This function indexes the reference genome FASTA file."
	echo ""
	echo "Usage: ./generate_index.sh -g \${genome}
	-g|--genome a FASTA file of the reference genome"
	exit 0
fi

while [[ "$#" -gt 0 ]]; do case $1 in
	-g|--genome) genome="$2"; shift;;
	*) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done


echo ""
echo "Reference genome: $genome"
echo ""

/usr/local/bin/bwa index ${genome}
/usr/local/bin/samtools faidx ${genome}
java -jar /usr/local/bin/picard.jar CreateSequenceDictionary R=${genome}

echo ""
