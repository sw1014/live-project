package mask;

public class appointment {
	public static void main(String[] args)
	{
		String id;
		id ="15";
		if(yuyue("id")==1&&leftmask("id")>0&&luckynum("id")<=3)
			System.out.println("预约成功");
	  /*yuyue("id");  //在预约表中  则返回1
		leftmask("id");  //返回剩余口罩数量 
		luckynum("id");	 //返回中签次数 */
		
		System.out.println("预约失败");
	}
	
	
	
	public static int yuyue(String id){
		String idform[];
		idform = new String[100];
		for(int i=0;i<100;i++)
		{
			if(id==idform[i])
				return 1;
		}		
		return 0;
	}
	
	public static int leftmask(String id) {
		
		return 0;
	}
	public static int luckynum(String id) {
		
		return 0;
	}
}
