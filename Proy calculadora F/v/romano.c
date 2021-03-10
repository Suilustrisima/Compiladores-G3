   int i = 0, num = 0;
   char romanNumber[100]; //array for storing roman number

   printf("Enter Roman number: ");
   scanf("%s", romanNumber);

   while(romanNumber[ i ])
   {
      //if condition for checking validity of roman number
      if(convert(romanNumber[ i ]) < 0 )
      {
         printf("\nInvalid Roman Number.\n");
         return 0;
      }

      //if condition for checking validity of roman number
      if((strlen(romanNumber) - i ) > 2)
      {
         if(convert(romanNumber[ i ]) < convert(romanNumber[i + 2]))
         {
            printf("\nInvalid Roman Number.\n");
            return 0;
         }
      }

      //if condition for converting roman number into decimal number
      if(convert(romanNumber[ i ]) >= convert(romanNumber[i + 1])) //true is first roman number is greater or equal to second
         num = num + convert(romanNumber[ i ]);
      else
      {
         num = num + (convert(romanNumber[i + 1]) - convert(romanNumber[ i ]));
         i++;
      }
      i++;
   }
