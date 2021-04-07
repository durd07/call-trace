package main

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetSubscriberTracingConfigTable(ctx *context.Context) table.Table {

	subscriberTracingConfig := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := subscriberTracingConfig.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Supi", "supi", db.Varchar)

	info.SetTable("subscriber_tracing_config").SetTitle("SubscriberTracingConfig").SetDescription("SubscriberTracingConfig")

	formList := subscriberTracingConfig.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Supi", "supi", db.Varchar, form.Text)

	formList.SetTable("subscriber_tracing_config").SetTitle("SubscriberTracingConfig").SetDescription("SubscriberTracingConfig")

	return subscriberTracingConfig
}
