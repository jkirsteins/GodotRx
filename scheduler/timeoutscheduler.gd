extends PeriodicScheduler
class_name TimeoutScheduler
## A scheduler that schedules work via a timer

func _init(verify_ = null):
	if not verify_ == "GDRx":
		push_warning("Warning! Must only instance Scheduler from GDRx singleton!")

## Returns singleton
static func singleton() -> TimeoutScheduler:
	return GDRx.TimeoutScheduler_

## Schedules an action to be executed.
## [br]
##        [b]Args:[/b]
## [br]
##            [code]action[/code] Action to be executed.
## [br]
##            [code]state[/code] [Optional] state to be given to the action function.
## [br][br]
##        [b]Returns:[/b]
## [br]
##            The disposable object used to cancel the scheduled action
##            (best effort).
func schedule(action : Callable, state = null) -> DisposableBase:
	if OS.get_thread_caller_id() == GDRx.MAIN_THREAD_ID:
		return SceneTreeTimeoutScheduler.singleton().schedule(action, state)
	return ThreadedTimeoutScheduler.singleton().schedule(action, state)

## Schedules an action to be executed after duetime.
## [br]
##        [b]Args:[/b]
## [br]
##            [code]duetime[/code] Relative time after which to execute the action.
## [br]
##            [code]action[/code] Action to be executed.
## [br]
##            [code]state[/code] [Optional] state to be given to the action function.
## [br][br]
##
##        [b]Returns:[/b]
## [br]
##            The disposable object used to cancel the scheduled action
##            (best effort).
func schedule_relative(duetime, action : Callable, state = null) -> DisposableBase:
	if OS.get_thread_caller_id() == GDRx.MAIN_THREAD_ID:
		return SceneTreeTimeoutScheduler.singleton().schedule_relative(duetime, action, state)
	return ThreadedTimeoutScheduler.singleton().schedule_relative(duetime, action, state)

## Schedules an action to be executed at duetime.
## [br]
##        [b]Args:[/b]
## [br]
##            [code]duetime[/code] Absolute time at which to execute the action.
## [br]
##            [code]action[/code] Action to be executed.
## [br]
##            [code]state[/code] [Optional] state to be given to the action function.
## [br][br]
##
##        [b]Returns:[/b]
## [br]
##            The disposable object used to cancel the scheduled action
##            (best effort).
func schedule_absolute(duetime, action : Callable, state = null) -> DisposableBase:
	if OS.get_thread_caller_id() == GDRx.MAIN_THREAD_ID:
		return SceneTreeTimeoutScheduler.singleton().schedule_absolute(duetime, action, state)
	return ThreadedTimeoutScheduler.singleton().schedule_absolute(duetime, action, state)
