local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local function copy(args)
	return args[1]
end

ls.add_snippets('ada', {
  s('with', {
    t('with '), i(1), t(';'), i(0)
  }),
  s('use', {
    t('use '), i(1), t(';'), i(0)
  }),
  s('wu', {
    t('with '), i(1), t('; use '), rep(1), t(';'), i(0)
  }),
  s('pas', {
    t('package '), i(1), t(' is'),
    t({'', '   '}), i(2),
    t({'', 'private'}),
    t({'', '   '}), i(3),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('pai', {
    t('package body '), i(1), t(' is'),
    t({'', '   '}), i(0),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('pri', {
    t('procedure '), i(1), t(' ('), i(2), t({') is', '   '}),
    i(3),
    t({'', 'begin', '   '}),
    i(4),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('prs', {
    t('procedure '), i(1), t(' ('), i(2), t(') '), i(3), t(';')
  }),
  s('fui', {
    t('function '), i(1), t(' ('), i(2), t(')'), t(' return '), i(3), t(' is'),
    t({'', '   '}), i(4),
    t({'', 'begin', '   '}),
    i(5),
    t({'', 'end '}), rep(1), t(';')
  }),
  s('fus', {
    t('function '), i(1), t(' ('), i(2), t(')'), t(' return '), i(3), t(';'),
  }),
  s('type', {
    t('type '), i(1), t(' is '), i(2), t(';'), i(0)
  }),
  s('record', {
    t({'record', '   '}), i(0), t({'', 'end record'})
  }),
  s('var', {
    i(1), t(' : '), i(2), t(';'), i(0)
  }),
  s('vara', {
    i(1), t(' : '), i(2), t(' := '), i(0), t(';')
  }),
  s('if', {
    t('if '), i(1), t(' then'), t({'', '   '}), i(0), t({'', 'end if;'})
  }),
  s('loop', {
    t({'loop', '   '}), i(0), t({'', 'end loop;'})
  }),
  s('for', {
    t('for '), i(1), t(' in '), i(2), t(' loop'),
    t({'', '   '}), i(0),
    t({'', 'end loop;'})
  }),
  s('while', {
    t('while '), i(1), t(' loop'),
    t({'', '   '}), i(0),
    t({'', 'end loop;'})
  })
})
