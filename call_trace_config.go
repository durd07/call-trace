package main

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetCallTraceConfigTable(ctx *context.Context) table.Table {

	callTraceConfig := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := callTraceConfig.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Public_id", "public_id", db.Varchar)

	info.SetTable("call_trace_config").SetTitle("CallTraceConfig").SetDescription("CallTraceConfig")

	formList := callTraceConfig.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Public_id", "public_id", db.Varchar, form.Text)

	formList.SetTable("call_trace_config").SetTitle("CallTraceConfig").SetDescription("CallTraceConfig")

	return callTraceConfig
}
