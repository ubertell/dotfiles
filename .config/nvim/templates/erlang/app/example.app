{application, 
 % Application name.
 example,
 % Options.
 [
  % A short description of the application.
  {description, "An example application"},
  % Application version number.
  {vsn, "0.0.1"},
  % All modules introduced by this application. 
  {modules, [example_app,
             example_sup,
             example_server]},
  % All names of registered processes in the application.
  {registred, [example_sup]},
  % All other applications that must be started before this application.
  % Note: all applications depend on at least 'kernel' and 'stdlib'.
  {applications, [kernel, stdlib]},
  % The callback module and start argument of the application.
  {mod, {example_app, []}}
 ]}.
