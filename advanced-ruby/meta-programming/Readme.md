define_method, method_missing, send, class_eval, instance_eval
Dynamic method definitions
DSL creation
Practical use: Rails validates, belongs_to

Metaprogramming is writing code that writes or modifies other code at runtime. It lets Ruby to be flexible and expensive - This is how Rails can define things like has_many, validates etc

Core tools in Metaprogramming:
1.	define_method 										:	Define methods dynamically
2.	method_missing 										:	Catches calls to undefine methods
3.	send															:	Calls methods (even private ones) by name
4.	eval, class_eval, instance_eval		: Dynamically evaluate Ruby code
5.	respond_to_missing?								:	Support method_missing for introspection

	