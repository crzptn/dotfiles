// Modify this file to change what commands output to your statusbar,
// and recompile using the make command.
	/*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/

static const Block blocks[] = {
	/* Icon    Command                                                         Interval  Signal */

	/* Network */
		{ "",
		  "nmcli -t -f TYPE,STATE dev | awk -F: '"
		  "  $2==\"connected\" && $1==\"ethernet\" { eth=1 }"
		  "  $2==\"connected\" && $1==\"wifi\"     { wifi=1 }"
		  "  END {"
		  "    if (wifi)      print \"󰤨 \";"
		  "    else if (eth)  print \"󰈀 \";"
		  "    else           print \"⚠ \";"
		  "  }"
		  "'",
		  5, 0 },

	/* Brightness */
	{ "󰃠 ",
	  "val=$(brightnessctl get -P); echo \"$val%\"",
	  5, 0 },

	/* Battery */
	{ "",
	  "status=$(cat /sys/class/power_supply/BAT0/status   2>/dev/null);"
	  "cap=$(cat    /sys/class/power_supply/BAT0/capacity 2>/dev/null);"
	  "[ -z \"$cap\" ] && exit;"
	  "[ \"$status\" = \"Charging\" ] && echo \"󰂄 $cap%\" && exit;"
	  "if   [ \"$cap\" -lt 20 ]; then echo \"󰁺 $cap%\";"
	  "elif [ \"$cap\" -lt 30 ]; then echo \"󰁻 $cap%\";"
	  "elif [ \"$cap\" -lt 40 ]; then echo \"󰁼 $cap%\";"
	  "elif [ \"$cap\" -lt 50 ]; then echo \"󰁽 $cap%\";"
	  "elif [ \"$cap\" -lt 60 ]; then echo \"󰁾 $cap%\";"
	  "elif [ \"$cap\" -lt 70 ]; then echo \"󰁿 $cap%\";"
	  "elif [ \"$cap\" -lt 80 ]; then echo \"󰂀 $cap%\";"
	  "elif [ \"$cap\" -lt 90 ]; then echo \"󰂁 $cap%\";"
	  "else                           echo \"󰂂 $cap%\"; fi",
	  5, 0 },

	/* Volume */
	{ "",
	  "pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes && echo \"󰝟 muted\" && exit;"
	  "vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}' | tr -d '%');"
	  "if   [ \"$vol\" -le 30 ]; then echo \"󰕿 $vol%\";"
	  "elif [ \"$vol\" -le 60 ]; then echo \"󰖀 $vol%\";"
	  "else                          echo \"󰕾 $vol%\"; fi",
	  5, 0 },

	/* Clock */
	{ "󱑆 ",
	  "date '+%I:%M%p'",
	  6, 0 },
};

// sets delimiter between status commands.
// NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
