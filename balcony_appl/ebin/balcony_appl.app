{application, gen_mnesia,
 [{description, "balcony_appl"},
  {vsn, "1.0.0"},
  {modules, [balcony_appl_app,
             balcony_appl_sup]},
  {registered, [balcony_appl]},
  {applications, [kernel, stdlib]},
  {mod, {balcony_appl_app, []}}
 ]}.
