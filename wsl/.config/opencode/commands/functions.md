---
description: List function calls used in component
---

list all functions -- may it be from convex, tRPC, server functions, remote functions -- used in $ARGUMENTS with their optimistic updates.

use the following format:

```
queries:
	- [function/s]
mutation:
	- [function]
		- [functions used in optimistic updates]
```
