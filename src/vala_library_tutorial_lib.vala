using GLib;

namespace DemoLibrary
{
	public const int MAJOR_VERSION = 0;
	public const int MINOR_VERSION = 1;

	/**
	 * Returns string representation of library version
	 *
	 * Note that major version guarantees stable api, while
	 * minor version can represent only incremental updates
	 *
	 * If api needs to be broken, only way to do that is by
	 * bumping major release
	 *
	 * Note!
	 * Only temporary exception to break rule is major version 
	 * 0 as it would be best to bump to 1 after testing api
	 * in production
	 *
	 * @since 0.1
	 */
	public static string get_version()
	{
		return ("%i.%i".printf (MAJOR_VERSION, MINOR_VERSION));
	}

	/**
	 * For gir introspection objects exposing properties or
	 * signals NEED to be derived from GObject
	 */
	public class DemoObject : Object
	{
		public string my_property { get; set; default = ""; }

		public signal void my_signal();

		public void send_signal()
		{
			my_signal();
		}

		public DemoObject()
		{
		}
	}
}
