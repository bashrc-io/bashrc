# The MIT License (MIT)
#
# Copyright (c) 2014 Fabrizio Lungo
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#############
# CONSTANTS #
#############

# Directory where **/*.brc files should be located
export BASHRC_DIR=$(readlink -f ./.bashrc.d)
export GLOBAL_BASHRC_DIR=$(readlink -f $(dirname ${BASH_SOURCE[0]})/.bashrc.d)

# We need globstar (and when I say need, I mean its nicer to use it than not)
shopt -s globstar

# Find all .brc scripts in the BASHRC_DIR and GLOBAL_BASHRC_DIR
if [ "$BASHRC_DIR" = "$GLOBAL_BASHRC_DIR" ]; then
	# Same directory just use one
	SCRIPTS=$BASHRC_DIR/**/*.brc
else
	# Merge and sort SCRIPTS
	SCRIPTS=$(ls $BASHRC_DIR/**/*.brc $GLOBAL_BASHRC_DIR/**/*.brc | sort)
fi
# Source each script
for script in $BASHRC_DIR/**/*.brc
do
	. $script
done
