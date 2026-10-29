// memory.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

# include <stdio.h>
# pragma bss_seg("bss")

// global variables

char    my_char = 'b';
short   my_short = 4000;
int     my_int = 100;
long    my_long = 65535;
double  my_double = 4.32;

// uninitialized global
int		my_int_array[100000000];

int adder(int num);

int main()
{
	// constant
	printf("Hello!\n");
	
	// global variables
	
	my_char++;
	my_short++;
	my_int++;
	my_long++;
	my_double++;
	printf("%c %hu %d %d %f\n", my_char, my_short, my_int, \
		my_long, my_double);
	
	
	// local variables
	
	int i, my_local = 2;
	my_local += rand();
	printf("%d\n", my_local);
	
	// fill unitialized
	my_int_array[0] = 1;
	
	// static variable
	for (int i=0; i<10; i++)
		printf("%d\n", adder(i));
	
	// allocate memory
	char *my_buffer;
	my_buffer = (char *)malloc(7);
	for (i = 0; i < 6; i++)
		my_buffer[i] = 'a';
	my_buffer[i] = '\0';
	printf("%s\n", my_buffer);
	free(my_buffer);
	
	return 0;
}


int adder(int num)
{
	static int sum = 0;
	sum += num;
	return sum;
}