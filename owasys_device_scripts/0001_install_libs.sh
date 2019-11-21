SCRIPT_DIR="/home/scripts"
INIT_SCRIPT="/home/userinit.sh"

chmod 777 $SCRIPT_DIR/init_libs.sh

echo "cd $SCRIPT_DIR" >> $INIT_SCRIPT
echo "./init_libs.sh"  >> $INIT_SCRIPT
