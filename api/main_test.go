/*
When testing package test, there are many duplicate debug logs written by Gin, which make it harder to read the test result.
The reason is because Gin is running in debug mode by default.
So we create this main_test.go file inside the api package
and config Gin to use test mode instead.
*/

package api

import (
	"os"
	"testing"

	"github.com/gin-gonic/gin"
)

func TestMain(m *testing.M) {
	gin.SetMode(gin.TestMode)
	os.Exit(m.Run())
}
