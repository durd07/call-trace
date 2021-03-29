refer to http://discuss.go-admin.com/t/goadmin-golang/17

package main

import (
	"fmt"
	"net/http"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
	form2 "github.com/GoAdminGroup/go-admin/plugins/admin/modules/form"
)

func GetCallTraceTable(ctx *context.Context) table.Table {

	callTrace := table.NewDefaultTable(table.DefaultConfigWithDriverAndConnection("mysql", "default"))

	info := callTrace.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Public_id", "public_id", db.Varchar)

	info.SetTable("call_trace").SetTitle("CallTrace").SetDescription("CallTrace")

	formList := callTrace.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Public_id", "public_id", db.Varchar, form.Text)

	formList.SetTable("call_trace").SetTitle("CallTrace").SetDescription("CallTrace")

	formList.SetPostHook(func(values form2.Values) error {
		v := fmt.Sprintf("%s:%s", values.Get("id"), values.Get("public_id"))
		http.Get("http://127.0.0.1:9999/" + v)
		return nil
	})

	return callTrace
}
