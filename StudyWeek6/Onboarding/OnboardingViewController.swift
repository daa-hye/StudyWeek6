//
//  OnboardingViewController.swift
//  StudyWeek6
//
//  Created by 박다혜 on 2023/08/25.
//

import UIKit

class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown
    }
}

class TwoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemCyan
    }
}

class ThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
    }
}

class OnboardingViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    var list: [UIViewController] = []

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        list = [OneViewController(), TwoViewController(), ThreeViewController()]

        view.backgroundColor = .lightGray
        delegate = self
        dataSource = self

        guard let first = list.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }

        let previousIndex = currentIndex - 1

        return previousIndex < 0 ? nil : list[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }

        let nextIndex = currentIndex + 1

        return nextIndex >= list.count ? nil : list[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = list.firstIndex(of: first) else { return 0 }
        return index
    }

}
