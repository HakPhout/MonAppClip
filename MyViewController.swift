import UIKit



class MyViewController: UIViewController {

    override func viewDidLoad() {

        super.viewDidLoad()

        view.backgroundColor = .systemBlue



        let label = UILabel()

        label.text = "Hello from Storyboard!"

        label.textColor = .white

        label.font = .systemFont(ofSize: 24, weight: .bold)

        label.translatesAutoresizingMaskIntoConstraints = false



        view.addSubview(label)

        NSLayoutConstraint.activate([

            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)

        ])

    }

}
