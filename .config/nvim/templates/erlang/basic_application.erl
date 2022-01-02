%%%-----------------------------------------------------------------------------
% ┌┐ ┌─┐┌─┐┬┌─┐    ┌─┐┌─┐┌─┐┬  ┬┌─┐┌─┐┌┬┐┬┌─┐┌┐┌
% ├┴┐├─┤└─┐││      ├─┤├─┘├─┘│  ││  ├─┤ │ ││ ││││
% └─┘┴ ┴└─┘┴└─┘────┴ ┴┴  ┴  ┴─┘┴└─┘┴ ┴ ┴ ┴└─┘┘└┘
% @author    <author>
% @copyright <copyright>
% @version   <version>
% @reference See <URL> for more information.
% @since     <since>
% @see       application
% @doc
% Basic example of a module with the application behaviour.
% @end
%%%-----------------------------------------------------------------------------

-module(basic_application).
-behaviour(application).

%%------------------------------------------------------------------------------
% INCLUDES
%%------------------------------------------------------------------------------

-include_lib("eunit/include/eunit.hrl").

%%------------------------------------------------------------------------------
% MACRO DEFS.
%%------------------------------------------------------------------------------

-define(IMPORTANT, 1).

%%------------------------------------------------------------------------------
% APPLICATION CALLBACKS
%%------------------------------------------------------------------------------

-export([start/2, stop/1]).

%%------------------------------------------------------------------------------
% APPLICATION CALLBACKS IMPL.
%%------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% start/2
%
% @doc
% This function is called whenever an application is started using 
% application:start/1,2.
%
% StartType is one of:
%
%  normal
%  {takeover, Node}
%  {failover, Node}
%
% Args is the argument defined by the application specification key 'mod'.
%
% start/2 is to return one of:
%
%  {ok, Pid}
%  {ok, Pid, State}
%  {error, Reason}
%
% @end
%-------------------------------------------------------------------------------

start(_StartType, _Args) ->
    basic_supervisor:start_link().

%-------------------------------------------------------------------------------
% stop/1
%
% This function is called whenever an application has stopped. 
%
% It is intended to be the opposite of Module:start/2 and is to do any necessary 
% cleaning up. 
%
% The return value of stop/1 is IGNORED.
%-------------------------------------------------------------------------------

stop(_State) ->
    ok.

%%------------------------------------------------------------------------------
% INTERNAL FUNCTIONS
%%------------------------------------------------------------------------------

% nothing here yet ...
