using DemoLibrary;

public class Application
{
	public static int main (string[] args)
	{
		DemoObject obj = new DemoObject();
		obj.my_property = "something";
		obj.my_signal.connect (() => {
			stdout.printf ("Signal received\n");
		});
		obj.send_signal();
		return (0);
	}
}