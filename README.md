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

        @Published var property: Model = ...

    }
```

3) Finally, make sure that the `viewModel` instance is marked as `@ObservedObject`


```swift
    struct ContentView: View {

        @ObservedObject var viewModel = ViewModel()

        var body: some View {
            ...
        }
    }
```
