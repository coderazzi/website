/*
Copyright (c) 2010 Luis M. Pena  - lu@coderazzi.net	[http://coderazzi.net]
MIT open source license: http://www.opensource.org/licenses/mit-license.php
*/

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ACTUAL_BRIGHTNESS_FILE "/sys/class/backlight/acpi_video0/actual_brightness"
#define BRIGHTNESS_FILE "/sys/class/backlight/acpi_video0/brightness"
#define MAX_BRIGHTNESS_FILE "/sys/class/backlight/acpi_video0/max_brightness"
#define BUFFER_SIZE 5
#define INVALID -1

int read(const char *file){
	int ret;
	char buffer[BUFFER_SIZE];
	FILE *f = fopen(file, "r");
	if (!f || !fgets(buffer, BUFFER_SIZE, f)){
		ret=INVALID;
		fprintf(stderr, "Could not read %s\n", file);
	} else {
		ret = strtol(buffer, (char **)0, 10);
		if (errno == EINVAL){
			ret=INVALID;
			fprintf(stderr, "Error reading %s; unexpected content:%s \n", file, buffer);
		}
	}
	if (f) fclose(f);
	return ret;
}

int brightness(int incr){
	int current = read(ACTUAL_BRIGHTNESS_FILE);
	int max = incr<1? current : read(MAX_BRIGHTNESS_FILE);
	int ret = 1;
	if (current!=INVALID && max!=INVALID){
		if (incr>0 && current>=max){
			fprintf(stderr, "brightness already at max level\n");
		} else if (incr<0 && current<=0){
			fprintf(stderr, "brightness already at min level\n");
		} else {
			FILE *f = fopen(BRIGHTNESS_FILE, "w");
			if (f && fprintf(f, "%d", current+incr)>0){
				ret=0;
			} else {			
				fprintf(stderr, "Error writing to %s\n", BRIGHTNESS_FILE);
			}
			if (f) fclose(f);
		}
	}
	return ret;
}

int main(int argc, char **argv){
	if (argc==2){
		if (!strcmp(argv[1], "up")){
			return brightness(1);
		} else if (!strcmp(argv[1], "down")){
			return brightness(-1);
		}
	}
	fprintf(stderr, "Please use: %s [up|down]\n", argv[0]);
	return 1;
}