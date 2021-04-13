package main

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetSubscriberTracingTable(ctx *context.Context) table.Table {

	subscriberTracing := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := subscriberTracing.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Trace_reference_id", "trace_reference_id", db.Varchar)
	info.AddField("Supi", "supi", db.Varchar)
	info.AddField("Timestamp", "timestamp", db.Timestamp)
	info.AddField("Address", "address", db.Varchar)
	info.AddField("Message", "message", db.Varchar)

	info.SetTable("subscriber_tracing").SetTitle("SubscriberTracing").SetDescription("SubscriberTracing")

	formList := subscriberTracing.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Trace_reference_id", "trace_reference_id", db.Varchar, form.Text)
	formList.AddField("Supi", "supi", db.Varchar, form.Text)
	formList.AddField("Timestamp", "timestamp", db.Timestamp, form.Datetime)
	formList.AddField("Address", "address", db.Varchar, form.Text)
	formList.AddField("Message", "message", db.Varchar, form.Text)

	formList.SetTable("subscriber_tracing").SetTitle("SubscriberTracing").SetDescription("SubscriberTracing")

	return subscriberTracing
}
