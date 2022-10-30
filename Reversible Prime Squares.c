#include <stdio.h>
#include <math.h> 
                                
int main ()
{
	int i,j, n, primesqr, rprime, rprimesqr;
	int remainder=0, m=0;
	double reverse=0.00;
	double sqroot;
	

	
	for(i=2; i<=4000; i++)
	{
			
		for(j=2; j<=i; j++)
		{
			
			if(i%j == 0)
			{
				break;
			}
		}
		
		if(i ==j) 
		{
			//if i == j, i is a prime number
			// primesqr is the square of the prime number i
			primesqr= i * i;
			
			
		}
		
		//here we reverse only the prime squares	
		if(primesqr == i * i)
		{
			reverse = 0.00;
			
			while(primesqr != 0)
			{
				
				remainder = primesqr % 10;
				reverse = reverse * 10;
				reverse = reverse + remainder;
				primesqr = primesqr / 10;	
			}
			
			
			/*checking whether primesqr is a palindrome.
			if reverse = primesqr = i*i, its a palindrome */
			if(reverse !=i * i )
			{
				
				sqroot = sqrt(reverse);
				//for reverses that aren't palidrimes, check if theyre prime	
				
				if(fmod(sqroot, 1.00) == 0.00)
				{
				
					for(n=2; n<=sqroot; n++)
					{
			
						if(fmod(sqroot, n) == 0)
						{
							break;
						}
					}
		
					if (sqroot ==n)
					{
			
					//square only prime number i whose reverse is also a prime number
					printf("is a reversible prime square%d\n", i * i);
					}
				}
				
			}
		}
	}

}
