//Q1
class GDP
{
  String country, currency;
  int year;
  float amountGDP;
  
  GDP(String line)
  {
    String[] fields = line.split(",");
    country = fields[0];
    currency = fields[1];
    year = Integer.parseInt(fields[3]);
    amountGDP = Float.parseFloat(fields[4]);
  }//end GDP
  
  GDP(TableRow row)
  {
    country = row.getString(0);
    currency = row.getString(1);
    year = row.getInt(3);
    amountGDP = row.getFloat(4); 
  }//end GDP
}//end class