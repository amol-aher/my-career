Creational Patterns: Focuses on object creation, abstraction and instantiation logic
	Singleton:
		Lets us ensure that a class has only one instance while providing global access point to this instance
	Factory Method:
		Provides an interface for creating objects in superclass, but allows subclasses to alter the type of objects that will be created
	Abstract factory: 
		Lets you produce families of related objects without specifying their concrete class
	Builder:
		Lets you construct complex objects step by step. This pattern allows you to produce different types and representations of object using same construction code 
	Prototype:
		Lets you copy existing objects without making your code dependent on their classes

Structural Patterns: Concerned with how objects are composed
	Bridge:
		Lets you split a large class or a set of closely related classess into two seperate hierarchies - abstraction and implementation - which can be developed independently of each other
	Decorator:
		Lets you attach new behaviors to objects by placing these objects inside special wrapper objects that contain the behabiors
	Adapter:
		Allows objects with incompatible interfaces to collaborate
	Composite:
		Lets you compose objects in tree structure and then work with these structures as if they were individual objects
	Proxy:
		Lets you provide a substitute or placeholder for another object. A proxy controls access to original object, allowing you to perform something either before or after the request gets through the original object
	FlyWeight:
		Lets you fit more objects into available amount of RAM by sharing common parts of state between multiple objectsinstead of keeping all data in each object
	Facade:
		Provides simplified interface to a library, a framework or any other complex set of classes

Behavioral Patterns:
	Chain of responsibility:
		Lets you pass a request along a chain of handlers. Upon receiving request, each handler decides either to process this request or to pass it to next handler in chain
	Command:
		Turns request into standalone object that contains all information about request. This transformation lets you pass requests as a method arguments, delay or queue a request's execution and support undoable operations
	Mediator:
		Lets you reduce chaotic dependencies between objects. This pattern restricts direct communication between the objects and forces them to collaborate only via mediator object
	Iterator:
		Lets you traverse elements of collection without exposing its underlying representation(lists, stack, tree, etc)
	Memento:
		Lets you save and restore previous state of object without revealing details of its implementation
	Observer:
		Lets you define subscription mechanism to notify multiple objects about any events that happen to the object they are observing
	State:
		Lets an object alter its behavior when its internal state changes. It appears as if object changed its class
	Strategy:
		Lets you define family of of algorithms, put each of them into seperate class and make their objects interchangable
	Template Method:
		Defines skeleton of algorithm in the superclass but let subclasses override specific steps of algorithm without changing its structure
	Visitor:
		Lets you seperate algorighms from objects on which they operate  