package main

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetSipmsgReportTable(ctx *context.Context) table.Table {

	sipmsgReport := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := sipmsgReport.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Bigint).
		FieldFilterable()
	info.AddField("Timestamp", "timestamp", db.Timestamp)
	info.AddField("Message", "message", db.Multilinestring)

	info.SetTable("sipmsg_report").SetTitle("SipmsgReport").SetDescription("SipmsgReport")

	formList := sipmsgReport.GetForm()
	formList.AddField("Id", "id", db.Bigint, form.Default)
	formList.AddField("Timestamp", "timestamp", db.Timestamp, form.Datetime)
	formList.AddField("Message", "message", db.Multilinestring, form.TextArea)

	formList.SetTable("sipmsg_report").SetTitle("SipmsgReport").SetDescription("SipmsgReport")

	return sipmsgReport
}
