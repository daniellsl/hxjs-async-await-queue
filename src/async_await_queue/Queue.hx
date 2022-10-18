package async_await_queue;

@:jsRequire("async-await-queue", "Queue") extern class Queue {
	function new(?_maxConcurrent:Float, ?_minCycle:Float);
	/**
		Signal that the task `hash` has finished.<br>
		Frees its slot in the queue
	**/
	function end(hash:Dynamic):Void;
	/**
		Wait for a slot in the queue
	**/
	function wait(hash:Dynamic, ?priority:Float):js.lib.Promise<ts.Undefined>;
	/**
		Run a job (equivalent to calling Queue.wait(), fn() and then Queue.end())<br>
		fn can be both synchronous or asynchronous function
	**/
	function run(fn:haxe.Constraints.Function, ?priority:Float):js.lib.Promise<Dynamic>;
	/**
		Return the number of running and waiting jobs
	**/
	function stat():QueueStats;
	/**
		Returns a promise that resolves when the queue is empty
	**/
	function flush():js.lib.Promise<ts.Undefined>;
	static var prototype : Queue;
}