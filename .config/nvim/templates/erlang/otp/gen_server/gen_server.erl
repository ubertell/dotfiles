%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ┌─┐┌─┐┌┐┌    ┌─┐┌─┐┬─┐┬  ┬┌─┐┬─┐
% │ ┬├┤ │││    └─┐├┤ ├┬┘└┐┌┘├┤ ├┬┘
% └─┘└─┘┘└┘────└─┘└─┘┴└─ └┘ └─┘┴└─
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% @author    <author>
% @copyright <copyright>
% @reference See <URL> for more information.
% @see       gen_server
% @since     <since>
% @version   <version>
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-module(?GEN_SERVER).
-behaviour(gen_server).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Includes
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-include_lib("eunit/include/eunit.hrl").

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Macros
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-define(SERVER, ?MODULE).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Module API 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-export([start_link/0]).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Gen_server callbacks
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-export([code_change/3,
         handle_call/3,
         handle_cast/2,
         handle_continue/2,
         handle_info/2,
         init/1,
         terminate/2]).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Data def.
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-record(state, {data}).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Module API 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%-------------------------------------------------------------------------------
% start_link/0
%-------------------------------------------------------------------------------
% @doc
% Creates a gen_server process using this module as the callback module.
% @end
%-------------------------------------------------------------------------------
-spec start_link() -> {ok, pid()} | ignore | {error, term()}. 
%-------------------------------------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%-------------------------------------------------------------------------------
% start_link_test/0
%-------------------------------------------------------------------------------
% @doc
% Test if start_link works as expected.
% @end
%-------------------------------------------------------------------------------
start_link_test() ->
    {ok, _} = start_link().

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Gen_server callbacks
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%-------------------------------------------------------------------------------
% init/1
%-------------------------------------------------------------------------------
% @doc
% Whenever a process is started by using one of:
%
%  gen_server:start/3,4, 
%  gen_server:start_monitor/3,4 or
%  gen_server:start_link/3,4
%
% init/1 is called by the new process to initialize. 
% @end
%-------------------------------------------------------------------------------
-spec init(term()) -> {ok, term()} | 
                      {ok, term(), int() >= 0} | 
                      {ok, term(), infinity} |
                      {ok, term(), hibernate} |
                      {ok, term(), {continue, term()}} |
                      {stop, term()} |
                      ignore.
%-------------------------------------------------------------------------------
init([]) ->
    {ok, #state{data = 1}}.

%-------------------------------------------------------------------------------
% handle_call/3
%-------------------------------------------------------------------------------
% @doc
% Whenever a gen_server process receives a request sent using 
% gen_server:call/2,3 or gen_server:multi_call/2,3,4 this function is called 
% to handle the request.
% @end
%-------------------------------------------------------------------------------
-spec handle_call(term(), pid(), term()) -> {reply, term(), term()} | 
                                            {reply, term(), term(), int() >= 0} | 
                                            {reply, term(), term(), infinity} |
                                            {reply, term(), term(), hibernate} |
                                            {reply, term(), term(), {continue, term()}} |
                                            {noreply, term()} |
                                            {noreply, term(), int() >= 0} |
                                            {noreply, term(), infinity} |
                                            {noreply, term(), {continue, term()}} |
                                            {stop, term(), term(), term()} |
                                            {stop, term(), term()}.
%-------------------------------------------------------------------------------
handle_call(_Request, _From, State) ->
    {reply, ignored, State}.

%-------------------------------------------------------------------------------
% handle_cast/2
%-------------------------------------------------------------------------------
% @doc 
% Whenever a gen_server process receives a request sent using cast/2 or 
% abcast/2,3, handle_cast/2 is called to handle the request.
% @end
%-------------------------------------------------------------------------------
-spec handle_cast(term(), term()) -> {noreply, term()} | 
                                     {noreply, term(), int() >= 0} | 
                                     {noreply, term(), infinity} | 
                                     {noreply, term(), {continue, term()}} | 
                                     {stop, term(), term()}.
%-------------------------------------------------------------------------------
handle_cast(_Msg, State) ->
    {noreply, State}.

%-------------------------------------------------------------------------------
% handle_info/2
%-------------------------------------------------------------------------------
% @doc 
% This function is called by a gen_server process when a time-out occurs or when
% it receives any other message than a synchronous or asynchronous request 
% (or a system message).
%
% Info is either the atom timeout, if a time-out has occurred, or the received 
% message.
%
% THIS CALLBACK IS OPTIONAL. 
% @end
%-------------------------------------------------------------------------------
-spec handle_info(term(), term()) -> {noreply, term()} | 
                                     {noreply, term(), int() >= 0} | 
                                     {noreply, term(), infinity} | 
                                     {noreply, term(), {continue, term()}} | 
                                     {stop, term(), term()}.
%-------------------------------------------------------------------------------
handle_info(_Info, State) ->
    {noreply, State}.

%-------------------------------------------------------------------------------
% handle_continue/2
%-------------------------------------------------------------------------------
% @doc
% This function is called by a gen_server process whenever a previous callback
% returns {continue, Continue}.
%
% THIS CALLBACK IS OPTIONAL, if continue is used and the callback is not 
% implemented, the process will exit with undef error.
%
% For a description of the other arguments and possible return values, 
% see handle_call/3.
% @end
%-------------------------------------------------------------------------------
-spec handle_continue(term(), term()) -> {reply, term(), term()} | 
                                         {reply, term(), term(), int() >= 0} | 
                                         {reply, term(), term(), infinity} |
                                         {reply, term(), term(), hibernate} |
                                         {reply, term(), term(), {continue, term()}} |
                                         {noreply, term()} |
                                         {noreply, term(), int() >= 0} |
                                         {noreply, term(), infinity} |
                                         {noreply, term(), {continue, term()}} |
                                         {stop, term(), term(), term()} |
                                         {stop, term(), term()}.
%-------------------------------------------------------------------------------
handle_continue(_Continue, State) ->
    {noreply, State}.

%-------------------------------------------------------------------------------
% terminate/2
%-------------------------------------------------------------------------------
% @doc 
% This function is called by a gen_server process when it is about to terminate.
%
% THIS CALLBACK IS OPTIONAL. 
%
% The return value of terminate/2 is IGNORED.
% @end
%-------------------------------------------------------------------------------
-spec terminate(term(), term()) -> ok. 
%-------------------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

%-------------------------------------------------------------------------------
% code_change/3
%-------------------------------------------------------------------------------
% @doc
% This function is called by a gen_server process when it is to update its 
% internal state during a release upgrade/downgrade.
%
% THIS CALLBACK IS OPTIONAL.
% @end.
%-------------------------------------------------------------------------------
-spec code_change(term(), term(), term()) -> {ok, term()} | {error, term()}.
%-------------------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Internal
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
