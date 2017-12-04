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

package cmdb

import (
	`time`
	`github.com/jscherff/cmdbd/store`
)

type Errors struct {
	id		interface{}	`db:"id"`
	Code		int		`db:"code"`
	Source		string		`db:"source"`
	Description	string		`db:"description"`
	EventDate	time.Time	`db:"event_date"`
}

type Sequence struct {
	Ord		interface{}	`db:"ord"`
	IssueDate	time.Time	`db:"issue_date"`
}

type Users struct {
	id		interface{}	`db:"id"`
	Username	string		`db:"username"`
	Password	string		`db:"password"`
	Created		time.Time	`db:"created"`
	Locked		bool		`db:"locked"`
	Role		string		`db:"role"`
}

func Init(queryFile, storeName string) (error) {

	if ds, err := store.Lookup(storeName); err != nil {
		return err
	} else if err := ds.Prepare(queryFile); err != nil {
		return err
	}

