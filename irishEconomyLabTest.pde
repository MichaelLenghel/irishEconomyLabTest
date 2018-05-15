//get classes

void setup()
{
  //Sets size of screen
  size(500, 500);
  loadData();//laods data from file
  calcMinMax();
}//end sertup

//Q2
ArrayList<GDP> data = new ArrayList<GDP>();
float border = width * 0.2f, min, max;

//Q3
void loadData()
{
  data.clear();
  Table t = loadTable("gdp.csv");
  for(int i = 0; i < t.getRowCount(); i++)
  {
    TableRow row = t.getRow(i);
    GDP gdp = new GDP(row);
    data.add(gdp);
  }//end for
  
}//end loadData

//Q4 (We do this since it is important when we map it)
void calcMinMax()
{
  //Assign to first element as a starting point
  min = max = data.get(0).amountGDP;
  for(GDP gdp: data)
  {
    if(gdp.amountGDP < min)
    {
      min = gdp.amountGDP;
    }//end min
    
    if (gdp.amountGDP > max)
    {
      max = gdp.amountGDP;
    }//end else
  }//end for
}//end calcMinMax

//Q4
void drawLineAndGraph()
{
  stroke(255);
  //line(border, height - border, width - border, height - border);//x1, y1, x2, y2
  //line(border, height - border, border, border);//x1, y1, x2, y2
  line(0, 0, 0, height);
  line(0, height, width, height);
  for (int i = 1; i < data.size(); i++)
  {
    stroke(0, 255, 255);
    
    
    //|Will map for the number of elements, from 0 to the size of the data. The y accouts for how much in my border.
    //float x1 = map(i - 1, 0, data.size() - 1, border, width - border);
    //Maps data set from minimum to maxiomum values and then accounts for border
    //float y1 = map(data.get(i - 1).amountGDP, min, max, height - border, border);
    //Again, length of data, from 0 to size - 1, taking account of border
    //float x2 = map(i, 0, data.size() - 1, border, width - border);
    //same stuff
    //float y2 = map(data.get(i).amountGDP, min, max, height - border, border);
    //line(x1, y1, x2, y2);
    
    
    
    fill(255, 0, 0);
    stroke(255, 0, 0);
    float x1 = map(i - 1, 0, data.size() - 1, 0, width);
    float y1 = map(data.get(i - 1).amountGDP, min, max, height, 0);
    float x2 = map(i, 0, data.size() - 1, 0, width);
    float y2 = map(data.get(i).amountGDP, min, max, height, 0);
    line(x1, y1, x2, y2);
    
  }//end for
}//end drawLineAndGraph

//Q5
void drawGDPAmount()
{
  if (mouseX >= border && mouseX <= height - border)
  {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    line(mouseX, border, mouseX, height - border);
    int i = (int) map(mouseX, border, width - border, 0, data.size() - 1);
    float y = map(data.get(i).amountGDP, min, max, height - border, border);
    ellipse(mouseX, y, 5, 5);
    fill(255);
    text("Year: " + data.get(i).year, mouseX + 10, y);
    text("GDP (Mill$): " + data.get(i).amountGDP, mouseX + 10, y + 10);
  }//end if
}//end drawGDPAmount

void draw()
{
  background(10);
  drawLineAndGraph();
  drawGDPAmount();
}//end draw