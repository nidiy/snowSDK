package snow.mvc.patterns.command 
{

	import snow.mvc.interfaces.*;
	import snow.mvc.patterns.observer.*;
	import snow.mvc.interfaces.ICommand;
	import snow.mvc.interfaces.INotification;
	import snow.mvc.interfaces.INotifier;
	import snow.mvc.patterns.observer.Notifier;
	

	public class MacroCommand extends Notifier implements ICommand, INotifier
	{
		
		private var subCommands:Array;
		
		public function MacroCommand()
		{
			subCommands = new Array();
			initializeMacroCommand();	
		}
		protected function initializeMacroCommand():void
		{
			
		}
		protected function addSubCommand(commandClassRef:Class): void
		{
			subCommands.push(commandClassRef);
		}
		public final function execute(notification:INotification) : void
		{
			while (subCommands.length > 0) {
				var commandClassRef:Class = subCommands.shift();
				var commandInstance:ICommand = new commandClassRef();
				commandInstance.facade = this.facade;
				commandInstance.execute(notification);
			}
		}
								
	}
}