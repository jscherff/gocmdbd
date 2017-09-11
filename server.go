// Copyright 2017 John Scherff
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"fmt"
	"net/http"
	"time"
)

// Config contains infomation about the server process and log writers.
type Server struct {
	*http.Server
	AllowedContentTypes []string
	AllowedMethods []string
}

// NewConfig creates a new Config object and reads its configuration from
// the provided JSON configuration file.
func (this *Server) Init() {

	this.ReadTimeout *= time.Second
	this.WriteTimeout *= time.Second
	this.Handler = NewRouter()
}

// Info provides identifying information about the server.
func (this *Server) Info() (string) {
	return fmt.Sprintf("Server started and listening on %q", this.Addr)
}