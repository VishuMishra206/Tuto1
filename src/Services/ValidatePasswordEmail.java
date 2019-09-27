package Services;

import java.util.regex.Pattern;

public class ValidatePasswordEmail {

	public static boolean	validationpass( String password)
	{

		if (password.matches(".*[0-9]{1,}.*")
				&& password.matches(".*[@#$]{1,}.*") && password.length()>=6 && password.length()<=20) 
			{
			return true; 
			}
		
		else
		{
			return false;
		}
	}
}
