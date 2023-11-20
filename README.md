# GenericNetworkManager

Generic network manager class `GenericNetworkManager` responsible for making API requests and handling responses. It encapsulates common networking functionality, such as constructing URLs, making asynchronous requests using URLSession, and decoding responses using generics to support a variety of response types.


## Features

The 'GenericNetworkManager' class is designed to be flexible and reusable across different parts of an application, providing a solid foundation for making API requests in a generic and reusable manner. This design allows for easy integration with various APIs by allowing users to specify the appropriate endpoint and expected response type. The mentioned improvements serve as suggestions to enhance the class's flexibility and usability in various scenarios.


## Installation

#### Swift Package Manager (SPM)

1. Open your Xcode project.
2. Navigate to the File menu and select "Swift Packages" > "Add Package Dependency..."
3. Enter the URL of the repository containing your GenericNetworkManager class.
4. Specify the version or branch you want to use.
5. Xcode will automatically resolve and fetch the package.


## Usage

1. Import the GenericNetworkManager module in your Swift files where you want to use it: 

    ```swift
    import GenericNetworkManager
    ```
2. Create an instance of `GenericNetworkManager` with your API base URL:

    ```swift
    let networkManager = GenericNetworkManager(baseURL: "https://api.example.com")
    ```
3. Perform a network request using the `fetchFacts` method:

    ```swift
    networkManager.fetchFacts(endpoint: "/example-endpoint") { result in
    // Handle the result here
    }
    ```
    
Make sure to replace `https://api.example.com` with your actual API base URL and `/example-endpoint` with the specific endpoint you intend to use. This adjusted usage example provides a more generalized structure without specifying the result handling, allowing users to adapt it based on their specific needs.


## Release History

#### Tags:
* 0.0.2 - 20.11.2023
    * CHANGE: Resolve issues with the class name and endpoint parameter from init.
* 0.0.1 - 20.11.2023
    * Project setup.


## Author

#### Eka Kelenjeridze

- GitHub: [Your GitHub Profile](https://github.com/ekakele)
- LinkedIn: [Your LinkedIn Profile](https://www.linkedin.com/feed/)

> Feel free to reach out if you have any questions, feedback, or just want to connect!




