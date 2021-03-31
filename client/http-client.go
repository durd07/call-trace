package main

import (
	"io/ioutil"
	"bytes"
	"bufio"
	"fmt"
	"net/http"
)

func main() {
	var trace_id int32
	resp, err := http.Get("http://felixdu.hz.dynamic.nsn-net.net:9033/should-be-traced?puid=sip:felix.du@nokia-sbell.com")
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()

	fmt.Println("Response status:", resp.Status)

	scanner := bufio.NewScanner(resp.Body)
	for i := 0; scanner.Scan() && i < 5; i++ {
		fmt.Println(scanner.Text())
	}

	if err := scanner.Err(); err != nil {
		panic(err)
	}

	url := "http://felixdu.hz.dynamic.nsn-net.net:9033/trace"
	mybyte := fmt.Sprintf(`{"puid":"sip:felix.du@nokia-sbell.com", "trace_id": %d, "timestamp": "2021-03-29 16:56:33", "msg": "12345678"}`, trace_id)
	var jsonStr = []byte(mybyte)
	req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonStr))
	req.Header.Set("Content-type", "application/json")
	//-H "Accept: application/json" -H "Content-type: application/json"
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err = client.Do(req)
	if err != nil {
		panic(err)
	}
	defer resp.Body.Close()

	fmt.Println("Response Status:", resp.Status)
	fmt.Println("Response Headers:", resp.Header)
	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Println("Response Body:", string(body))
}
