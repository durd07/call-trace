package main

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetCallTraceTable(ctx *context.Context) table.Table {

	callTrace := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := callTrace.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Public_id", "public_id", db.Varchar)
	info.AddField("Timestamp", "timestamp", db.Varchar)
	info.AddField("Message", "message", db.Varchar)

	info.SetTable("call_trace").SetTitle("CallTrace").SetDescription("CallTrace")

	formList := callTrace.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Public_id", "public_id", db.Varchar, form.Text)
	formList.AddField("Timestamp", "timestamp", db.Varchar, form.Text)
	formList.AddField("Message", "message", db.Varchar, form.Text)

	formList.SetTable("call_trace").SetTitle("CallTrace").SetDescription("CallTrace")

	return callTrace
}
