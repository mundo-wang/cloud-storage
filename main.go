package main

import "github.com/mundo-wang/wtool/wlog"

func main() {
	wlog.Info("hello world").Field("name", "Mundo").Log()
}
