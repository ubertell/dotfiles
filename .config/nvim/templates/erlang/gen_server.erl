%%%-----------------------------------------------------------------------------
% ┌─┐┌─┐┌┐┌    ┌─┐┌─┐┬─┐┬  ┬┌─┐┬─┐
% │ ┬├┤ │││    └─┐├┤ ├┬┘└┐┌┘├┤ ├┬┘
% └─┘└─┘┘└┘────└─┘└─┘┴└─ └┘ └─┘┴└─
%
% @author    <author>
% @version   0.0.1
% @doc
%
% @end
%%%-----------------------------------------------------------------------------

-module(example).
-behaviour(gen_server).

%%------------------------------------------------------------------------------
% MACRO DEFS.
%%------------------------------------------------------------------------------

-define(SERVER, ?MODULE).

%%------------------------------------------------------------------------------
% PUBLIC API 
%%------------------------------------------------------------------------------

-export([start_link/0]).

%%------------------------------------------------------------------------------
% GEN_SERVER CALLBACKS
%%------------------------------------------------------------------------------

-export([code_change/3,
         handle_call/3,
         handle_cast/2,
         handle_continue/2,
         handle_info/2,
         init/1,
         terminate/2]).

%%------------------------------------------------------------------------------
% RECORD DEFS.
%%------------------------------------------------------------------------------

-record(state, {}).

%%------------------------------------------------------------------------------
% API IMPL.
%%------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% start_link/0
%
% @doc
% Create a gen_server process using this module.
% @end
%-------------------------------------------------------------------------------
-spec start_link() -> {ok, Pid :: pid()} | 
                      ignore | 
                      {error, {already_started, Pid :: pid()}} |
                      {error, Error :: term()}.

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%%------------------------------------------------------------------------------
% GEN_SERVER CALLBACKS IMPL.
%%------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% init/1
%
% @doc
% Whenever a process is started by using one of:
%
%  gen_server:start/3,4
%  gen_server:start_monitor/3,4
%  gen_server:start_link/3,4
%
% init/1 is called by the new process to initialize. 
%
% If the initialization is SUCCESSFUL, init/1 is to return one of:
%
%  {ok, State} 
%  {ok, State, Timeout}
%  {ok, State, infinity}
%  {ok, State, hibernate}
%  {ok, State, {continue, Continue}}
%
% where a 'timeout' is handled by handle_info(timeout, State), and
% a 'continue' is handled by handle_continue(Continue, State). 
%
% If the initialization FAILS, init/1 is to return one of:
%
%  {stop, Reason}
%  ignore
%
% @end
%-------------------------------------------------------------------------------

init([]) ->
    {ok, #state{}}.

%-------------------------------------------------------------------------------
% handle_call/3
%
% @doc
% Whenever a gen_server process receives a request sent using 
% gen_server:call/2,3 or gen_server:multi_call/2,3,4, this function is called 
% to handle the request.
%
% handle_call/3 is to return one of: 
%
%  {reply, Reply, NewState}
%  {reply, Reply, NewState, Timeout}
%  {reply, Reply, NewState, infinity}
%  {reply, Reply, NewState, hibernate}
%
%  {reply, Reply, NewState, {continue, Continue}}
%
%  {noreply, NewState}
%  {noreply, NewState, Timeout}
%  {noreply, NewState, infinity}
%  {noreply, NewState, hibernate}
%
%  {noreply, NewState, {continue, Continue}}
%
%  {stop, Reason, Reply, NewState} 
%  {stop, Reason, NewState} 
%
% If {..., {continue, Continue}} then handle_continue/2 is invoked. 
%
% If {noreply, ...} any reply to From must be specified explicitly using 
% gen_server:reply/2.
%
% If {stop, ... } then the gen_server process calls terminate(Reason,NewState) 
% and terminates.
% @end
%-------------------------------------------------------------------------------

handle_call(_Request, _From, State) ->
    {reply, ignored, State}.

%-------------------------------------------------------------------------------
% handle_cast/2
%
% @doc 
% Whenever a gen_server process receives a request sent using cast/2 or 
% abcast/2,3, handle_cast/2 is called to handle the request.
%
% handle_cast/2 is to return one of: 
%
%  {noreply, NewState}
%  {noreply, NewState, Timeout}
%  {noreply, NewState, infinity}
%  {noreply, NewState, hibernate}
%
%  {noreply, NewState, {continue, Continue}}
%
%  {stop, Reason, NewState} 
%
% If {..., {continue, Continue}} then handle_continue/2 is invoked. 
%
% If {stop, ... } then the gen_server process calls terminate(Reason,NewState) 
% and terminates.
% @end
%-------------------------------------------------------------------------------

handle_cast(_Msg, State) ->
    {noreply, State}.

%-------------------------------------------------------------------------------
% handle_info/2
%
% @doc 
% This function is called by a gen_server process when a time-out occurs or when
% it receives any other message than a synchronous or asynchronous request 
% (or a system message).
%
% THIS CALLBACK IS OPTIONAL. 
%
% handle_info/2 is to return one of: 
%
%  {noreply, NewState}
%  {noreply, NewState, Timeout}
%  {noreply, NewState, infinity}
%  {noreply, NewState, hibernate}
%
%  {noreply, NewState, {continue, Continue}}
%
%  {stop, Reason, NewState} 
%
% If {..., {continue, Continue}} then handle_continue/2 is invoked. 
%
% If {stop, ... } then the gen_server process calls terminate(Reason,NewState) 
% and terminates.
% @end
%-------------------------------------------------------------------------------

handle_info(_Info, State) ->
    {noreply, State}.

%-------------------------------------------------------------------------------
% handle_continue/2
%
% @doc
% This function is called by a gen_server process whenever a previous callback
% returns {continue, Continue}.
%
% THIS CALLBACK IS OPTIONAL, if continue is used and the callback is not 
% implemented, the process will exit with undef error.
%
% For a description of the other arguments and possible return values, 
% see Module:handle_call/3.
% @end
%-------------------------------------------------------------------------------

handle_continue(_Continue, State) ->
    {noreply, State}.

%-------------------------------------------------------------------------------
% terminate/2
%
% @doc 
% This function is called by a gen_server process when it is about to terminate.
%
% THIS CALLBACK IS OPTIONAL. 
%
% Reason depends on why the gen_server process is terminating. 
%
% If it is because another callback function has returned a stop tuple 
% {stop,..}, Reason has the value specified in that tuple. 
%
% If it is because of a failure, Reason is the error reason.
%
% If the gen_server process is part of a supervision tree and is ordered by its 
% supervisor to terminate, this function is called with Reason=shutdown if the 
% following conditions apply:
%
% - The gen_server process has been set to trap exit signals.
% - The shutdown strategy as defined in the child specification of the 
%   supervisor is an integer time-out value, not brutal_kill.
%
% Even if the gen_server process is not part of a supervision tree, this 
% function is called if it receives an 'EXIT' message from its parent. 
%
% Reason is the same as in the 'EXIT' message.
%
% Otherwise, the gen_server process terminates immediately.
%
% The return value of terminate/2 IGNORED.
% @end
%-------------------------------------------------------------------------------

terminate(_Reason, _State) ->
    ok.

%-------------------------------------------------------------------------------
% code_change/3
%
% @doc
% This function is called by a gen_server process when it is to update its 
% internal state during a release upgrade/downgrade.
%
% THIS CALLBACK IS OPTIONAL.
% @end.
%-------------------------------------------------------------------------------

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%------------------------------------------------------------------------------
% INTERNAL FUNCTIONS
%%------------------------------------------------------------------------------

% nothing here yet ...
