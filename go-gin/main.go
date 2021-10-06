package main

import (
    "fmt"
    "github.com/gin-gonic/gin"
    "strconv"
    "time"
)

func getDelay(c *gin.Context) {
    seconds, err := strconv.Atoi(c.Param("seconds"))
    if err != nil {
        c.String(400, "Invalid integer")
    }
    fmt.Printf("Delay %d seconds\n", seconds)
    time.Sleep(time.Duration(seconds) * time.Second)
    fmt.Println("Delay finished")
    c.String(200, fmt.Sprintf("Delay %d seconds", seconds))
}

func main() {
    router := gin.Default()
    router.GET("/delay/:seconds", getDelay)

    router.Run("localhost:3001")
}
