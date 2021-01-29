# SwiftUI-MVVM-Example


**A basic example of reactive View-ViewModel binding ([MVVM Architecture](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)) in SwiftUI using `ObservableObject`, `@ObservedObject` and `@Published`**

---

**Basic steps:**

1) Ensure that your View Model class conforms to `ObservableObject`

```swift
    class ViewModel: ObservableObject {...}
```


2) Ensure that the bindable property in your View Model class is marked as `@Published`

```swift
    class ViewModel: ObservableObject {

        @Published var model: Model = ...

    }
```

3) Ensure that the `viewModel` instance is marked as `@ObservedObject`


```swift
    struct ContentView: View {

        @ObservedObject var viewModel = ViewModel()

        var body: some View {
            ...
        }
    }
```

4) Finally, use the property to set up the bind between the View and View Model

```swift
    struct ContentView: View {

        @ObservedObject var viewModel = ViewModel()

        var body: some View {
            Text("\(viewModel.model.property)")
        }
    }
```
