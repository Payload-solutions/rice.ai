package server

import (
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type Server struct {
	router *gin.Engine
}

func NewServer() {
	s := &Server{
		router: gin.Default(),
	}
	s.router.Use(CORSMiddleware())
	Router(s.router)

	serve := &http.Server{
		Addr:    ":8000",
		Handler: s.router,
	}
	if err := serve.ListenAndServe(); err != nil && err != http.ErrServerClosed {
		log.Fatalf("listen: %s\n", err)
	}
}

func CORSMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "POST, OPTIONS, GET, PUT")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(204)
			return
		}

		c.Next()
	}
}

// func (s *Server) registerRoutes() error {
// 	group := s.router.Group("/api")

// 	group.
// 		GET("/", CNNHandler)

// 	s.router.Use(func(c *gin.Context) {
// 		c.JSON(404, JsonResponse{
// 			Success: false,
// 			Error:   "resource not found",
// 		})
// 	})
// 	return nil
// }

// func (s *Server) ListeningAndService(add string) error {
// 	return s.router.Run()

// }

// func (s *Server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
// 	s.router.ServeHTTP(w, r)
// }
