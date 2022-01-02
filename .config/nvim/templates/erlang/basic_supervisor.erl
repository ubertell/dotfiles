%%%-----------------------------------------------------------------------------
% ┌┐ ┌─┐┌─┐┬┌─┐    ┌─┐┬ ┬┌─┐┌─┐┬─┐┬  ┬┬┌─┐┌─┐┬─┐
% ├┴┐├─┤└─┐││      └─┐│ │├─┘├┤ ├┬┘└┐┌┘│└─┐│ │├┬┘
% └─┘┴ ┴└─┘┴└─┘────└─┘└─┘┴  └─┘┴└─ └┘ ┴└─┘└─┘┴└─
% @author    <author>
% @copyright <copyright>
% @version   <version>
% @reference See <URL> for more information.
% @since     <since>
% @see       supervisor
% @doc
% Basic example of a module with the supervisor behaviour.
% @end
%%%-----------------------------------------------------------------------------

-module(basic_supervisor).
-behaviour(supervisor).

%%------------------------------------------------------------------------------
% MACRO DEFS.
%%------------------------------------------------------------------------------

-define(SERVER, ?MODULE).

%%------------------------------------------------------------------------------
% PUBLIC API 
%%------------------------------------------------------------------------------

-export([start_link/0]).

%%------------------------------------------------------------------------------
% SUPERVISOR CALLBACKS
%%------------------------------------------------------------------------------

-export([init/1]).

%%------------------------------------------------------------------------------
% PUBLIC API IMPL.
%%------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% start_link/0
%
% @doc
% Create a supervisor process using this module.
% @end
%-------------------------------------------------------------------------------
-spec start_link() -> {ok, Pid :: pid()} | 
                      ignore |
                      {error, {alread_started, Pid :: pid()}} |
                      {error, {shutdown, Reason :: term()}} |
                      {error, Reason :: term()}.
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%------------------------------------------------------------------------------
% SUPERVISOR CALLBACKS IMPL.
%%------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% init/1
%
% @doc
% Whenever a supervisor is started using start_link/2,3, this function is called
% by the new process to find out about restart strategy, maximum restart 
% intensity, and child specifications.
%
% Args is the Args argument provided to the start function.
%
% init/1 is to return one of:
%
%  {ok, {SupFlags, [ChildSpec]}}
%  ignore
%
% SupFlags is the supervisor flags defining the restart strategy and maximum 
% restart intensity for the supervisor. 
%
% [ChildSpec] is a list of valid child specifications defining which child 
% processes the supervisor must start and monitor. 
%
% NOTE: When the restart strategy is simple_one_for_one, the list of child 
% specifications must be a list with one child specification only. 
% (The child specification identifier is ignored.) 
% No child process is then started during the initialization phase, but all 
% children are assumed to be started dynamically using start_child/2.
%
% NOTE: init/1 must have NO side effects.
% @end
%-------------------------------------------------------------------------------

init(_Args) ->
    SupFlags = #{% 'strategy' sets what to do if a child process terminates.
                 % Value is one of
                 % 'one_for_one': The child process is restarted
                 % 'one_for_all': All other children are terminated
                 % 'rest_for_one': All other children AFTER is also terminated
                 % 'simple_one_for_one': A version of 'one_for_one', where
                 % all children are dynamically added instances of the same
                 % process.
                 strategy => one_for_one, 

                 % The restart intensity limits the number of restarts which can 
                 % occur in a given time interval. If the intensity is exceeded
                 % the supervisor terminate it self and all its children.
                 %
                 % 'intensity': max number of restarts.
                 % 'perdiod': time interval in seconds.
                 intensity => 0, % DEV
                 period => 1
                },
    Child = #{% 'id' is used to identify the child specification by the 
              % supervior (mandatory).
              id => basic_gen_server, 

              % 'start': the function call used to start the child 
              % process. It is a module-function-arguments tuple.
              start => {basic_gen_server, start_link, []}, 

              % 'restart': when a terminated child process is to be restarted. 
              % Values is one of:
              % 'permanent': child is always restarted.
              % 'temporary': child is never restarted.
              % 'transient': child process is restarted only if terminated
              % abonormally.
              restart => permanent, 

              % 'shutdown': how a child process is to be terminated.
              % Values is one of:
              % 'brutal_kill': child is unconditionally terminated using 
              % exit(Child, kill)
              % INTEGER TIMEOUT: supervisor tells the child to terminate using
              % exit(Child, shutdown) then waits for TIMOUT seconds at most.
              % If child is supervisor TIMOUT must be set to 'infinity'.
              shutdown => brutal_kill, 

              % 'type': specifies if the child process is a supervisor or worker
              % Values is one of: 'supervisor' or 'worker'.
              type => worker, 

              % 'modules': a list with ONE element [Module], where Module is the
              % name of the callback module. If child is a supervisor then
              % 'gen_server' or 'gen_statem'. If child is a gen_event then
              % 'dynamic'.
              %
              % This information is used by the release handler during upgrades.
              modules => [basic_gen_server]
             }
    ChildSpecs = [Child],
    {ok, {SupFlags, ChildSpecs}}.
