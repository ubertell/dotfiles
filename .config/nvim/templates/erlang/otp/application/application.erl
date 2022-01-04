%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ┌─┐┌─┐┌─┐┬  ┬┌─┐┌─┐┌┬┐┬┌─┐┌┐┌
% ├─┤├─┘├─┘│  ││  ├─┤ │ ││ ││││
% ┴ ┴┴  ┴  ┴─┘┴└─┘┴ ┴ ┴ ┴└─┘┘└┘
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% @author    <author>
% @copyright <copyright>
% @reference See <URL> for more information.
% @see       application
% @since     <since>
% @version   <version>
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-module(?APPLICATION).
-behaviour(application).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Includes
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-include_lib("eunit/include/eunit.hrl").

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Macros
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-define(OK, ok).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Application callbacks
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-export([start/2, stop/1]).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Application callbacks
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

%-------------------------------------------------------------------------------
% start/2
%-------------------------------------------------------------------------------
% @doc
% This function is called whenever an application is started using 
% application:start/1,2.
%
% Args is the argument defined by the application specification key 'mod'.
% @end
%-------------------------------------------------------------------------------
-spec start(application:start_type(), term()) -> {ok, pid()} | 
                                                 {ok, pid(), term()} |
                                                 {error, term()}.
%-------------------------------------------------------------------------------
start(_StartType, _Args) ->
    ?SUPERVISOR:start_link().

%-------------------------------------------------------------------------------
% stop/1
%-------------------------------------------------------------------------------
% @doc
% This function is called whenever an application has stopped. 
%
% It is intended to be the opposite of Module:start/2 and is to do any necessary 
% cleaning up. 
%
% The return value of stop/1 is IGNORED.
% @end
%-------------------------------------------------------------------------------
-spec stop(term()) -> ok.
%-------------------------------------------------------------------------------
stop(_State) ->
    ok.

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Internal
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
