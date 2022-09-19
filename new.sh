#!/bin/bash

echo "which challenge are you working on?"
read day
touch day_$day.sh
echo "#!/bin/bash" >> day_$day.sh
chmod +x day_$day.sh