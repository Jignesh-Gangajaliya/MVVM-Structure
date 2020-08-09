# A sample app to demonstrate MVVM implementation in iOS
<br>

## MVVM architecture
> MVVM (Model-View-ViewModel) is derived from MVC(Model-View-Controller).
It is introduced to solve existing problems of Cocoa's MVC architecture in iOS world.
One of its feature is to make a better seperation of concerns so that it is easier to maintain and extend.
* Model: It is simillar to `model` layer in MVC (contains data business logic)
* View: UIViews + UIViewControllers (We treat both layout view and controllers as View)
* ViewModel: A mediator to glue two above layer together.

An important point in MVVM is that it uses a binder as communication tool between View and ViewModel layers.
A technique named `Data Binding` is used. 

<br>

## Sample MVVM Project Configuration
| Title         | Configurations |
|--------------|--------|
| Development Language | Swift 5.0    |
| Development Tools     | Xcode 11.5    |
| Orientation  | Portrait    |
| Device Support | iPhone    |
<br>

## Prerequisites
- Xcode 11.5 & Above
- Cocoapods 1.9.1 and above

<br>

## Contributer Name
- Jignesh Gangajaliya
<br>
